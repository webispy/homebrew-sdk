class NuguDbusDaemon < Formula
  desc "SESSION_BUS based dbus-daemon for NUGU service"
  homepage "https://github.com/nugulinux/macos-dbus-daemon"
  url "https://github.com/nugulinux/macos-dbus-daemon/archive/refs/heads/master.tar.gz"
  version "0.1.0"
  sha256 "4e02dadd0b14f6075733002383e1033a909f699d9c048e2e130033757bbd21ed"
  license "Apache-2.0"

  depends_on "cmake" => :build
  depends_on "dbus"

  def install
    args = %W[
      -DHOMEBREW_PREFIX=#{HOMEBREW_PREFIX}
      -DDBUS_PATH=#{Formula["dbus"].bin}
      -DSOCKET_PATH=#{sock_path}
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    prefix.install "build/com.sktnugu.nugu_dbus_daemon.plist"
  end

  def plist_name
    "com.sktnugu.nugu_dbus_daemon"
  end

  def sock_path
    "/var/run/nugu_dbus_daemon.sock"
  end

  def caveats
    <<~EOS
      To use dbus session bus, add the following to your .zshrc:

        export DBUS_SESSION_BUS_ADDRESS=unix:path=#{HOMEBREW_PREFIX}#{sock_path}
    EOS
  end

  test do
    system "true"
  end
end
