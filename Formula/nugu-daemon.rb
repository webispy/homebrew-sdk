class NuguDaemon < Formula
  desc "Daemon for NUGU service"
  homepage "https://github.com/nugulinux/nugu-daemon"
  url "https://github.com/nugulinux/nugu-daemon/archive/fc4b05c.tar.gz"
  version "1.7.3"
  sha256 "26e7376ba6e50517c3b331934c14c77cdf8fcb5ac71831218e4985e41dac691b"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD nugu-daemon
  head "https://github.com/nugulinux/nugu-daemon.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/nugu-daemon-1.7.3"
    sha256 monterey: "d8b5c24ab278586ead76045a5d9951dcc11ff732f555017f036a1eb56ca2e66b"
    sha256 big_sur:  "8852eca9a809bad9726bda3891ce9bbed836c65216e565b5b6c03aa173ee2f6b"
  end

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
      -DSESSION_BUS_ADDRESS=unix:path=#{HOMEBREW_PREFIX}/var/run/nugu_dbus_daemon.sock
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
