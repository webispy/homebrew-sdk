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
    rebuild 1
    sha256 arm64_sonoma: "3a159783c499d30c445f9caa25c05d0b6736972693724b7f484ee26801919629"
    sha256 ventura:      "cda9e9fbbba7e94be8ed51d64a2eadba9714755bd5d0388118e67056aa204c09"
    sha256 monterey:     "8d283c14790fdf18fb0ad3a313876bbbd88b991a26973de2c52dde7aa19e8c53"
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
