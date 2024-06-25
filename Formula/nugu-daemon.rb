require_relative "../lib/GitHubPrivateRepositorySnapshotDownloadStrategy"

class NuguDaemon < Formula
  desc "Daemon for NUGU service"
  homepage "https://github.com/webispy/nugu-daemon"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/webispy/#nugu-daemon/archive/refs/tags/1.7.5.tar.gz", using: GitHubPrivateRepositorySnapshotDownloadStrategy
  sha256 "5b7750c6462263735c69d294f0f6ea67c080cc142e41c4dc004c3aae48940862"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/nugu-daemon-1.7.5"
    sha256 arm64_sonoma: "9c688cb5ccfd3b05c8e20de496590af4d688652468fecf6a45c87339a684bd1a"
    sha256 ventura:      "0bcd4bdaa5626f56e22bfc7416d08be98b424d3ed90e55717cc3006076b87aa1"
    sha256 monterey:     "41f0febb8c0ee1197046299c4bb6186f608c98783e7435e06bc8e41ee33ef120"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "dbus"
  depends_on "libnugu-extension"
  depends_on "nugu-dbus-daemon"

  def install
    args = %W[
      -DENABLE_PULSEAUDIO=OFF
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
