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
    rebuild 1
    sha256 arm64_sonoma: "afc0c955cf73527ee8a67cfc7a773822403c3a3064f7b49105e7a7be4f38d4fb"
    sha256 ventura:      "8671181f1f121a69b1271dcdc17453fe0361b65657a8f79edf372521f442eb90"
    sha256 monterey:     "d3de356fd039368c5403f3221cd190cee8c3b206352305102e7bd4de20acb885"
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
