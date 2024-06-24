class NuguDbusDaemon < Formula
  desc "SESSION_BUS based dbus-daemon for NUGU service"
  homepage "https://github.com/nugulinux/macos-dbus-daemon"
  url "https://github.com/nugulinux/macos-dbus-daemon/archive/refs/heads/master.tar.gz"
  version "0.1.0"
  sha256 "4e02dadd0b14f6075733002383e1033a909f699d9c048e2e130033757bbd21ed"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/nugu-dbus-daemon-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "dfc1a9fcdb743e882b8fa913383aa40cd518b65b10acb2affc6e5737b22e2122"
    sha256 cellar: :any_skip_relocation, ventura:      "75112891d49d2eaea5aac800585e3af0697745ed6153bbf8081a5eaec412e51b"
    sha256 cellar: :any_skip_relocation, monterey:     "9332b24c0e6c1715eee721c300457f02158f62adbef0090389019702450a502f"
  end

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
