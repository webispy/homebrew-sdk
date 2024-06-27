require_relative "../lib/GitHubPrivateRepositorySnapshotDownloadStrategy"

class NuguDaemon < Formula
  desc "Daemon for NUGU service"
  homepage "https://github.com/webispy/nugu-daemon"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/webispy/#nugu-daemon/archive/refs/heads/master.tar.gz", using: GitHubPrivateRepositorySnapshotDownloadStrategy
  version "1.7.6"
  sha256 "bc9790569bfd60c8c4d98acaea33f8316f86c8e81d2ace7bbbd640b338fcd9b4"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/nugu-daemon-1.7.6"
    sha256 arm64_sonoma: "0a4757b9cecf66d9fd1e4b4c0ac61f451231543597c09a59d686d75318ce8172"
    sha256 ventura:      "041afd629b79a4a2f7c25420d0b94f163879c1b1574397f8fd2efb306ad469c5"
    sha256 monterey:     "38e556e30c79307ad0cb71e4d42ed2cc7eed8c8b9954ab5f839bf62f22f46084"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "dbus"
  depends_on "libnugu-extension"
  depends_on "nugu-dbus-daemon"

  def install
    args = %W[
      -DENABLE_SESSION_BUS=ON
      -DSESSION_BUS_ADDRESS=unix:path=#{HOMEBREW_PREFIX}#{Formula["nugu-dbus-daemon"].sock_path}
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
