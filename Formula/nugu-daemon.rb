require_relative "../lib/GitHubPrivateRepositorySnapshotDownloadStrategy"

class NuguDaemon < Formula
  desc "Daemon for NUGU service"
  homepage "https://github.com/webispy/nugu-daemon"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/webispy/#nugu-daemon/archive/refs/tags/1.7.5.tar.gz", using: GitHubPrivateRepositorySnapshotDownloadStrategy
  sha256 "5b7750c6462263735c69d294f0f6ea67c080cc142e41c4dc004c3aae48940862"
  license "Apache-2.0"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "dbus"
  depends_on "libnugu-extension"
  depends_on "libnugu-plugins"
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
