class NuguDbusDaemon < Formula
  desc "SESSION_BUS based dbus-daemon for NUGU service"
  homepage "https://github.com/nugulinux/nugu-daemon"
  url "https://github.com/nugulinux/nugu-daemon/archive/065c021.tar.gz"
  version "1.7.3"
  sha256 "20d9d12521add78db62be75a93cee3299d4173e8ebf73500d47f868f9307a57b"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/nugu-dbus-daemon-1.7.3"
    sha256 cellar: :any_skip_relocation, monterey: "4b8afd995b044c9f8e0d4ebe5cb4c6661075a1e7bf2df949a590131113a35e88"
    sha256 cellar: :any_skip_relocation, big_sur:  "656fc969a8ca73f051486eff48fafb3f2d9d45e11433254284cb29f135b79dba"
  end

  depends_on "cmake" => :build
  depends_on "dbus"

  def install
    args = %W[
      -DHOMEBREW_PREFIX=#{HOMEBREW_PREFIX}
      -DDBUS_PATH=#{Formula["dbus"].bin}
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    prefix.install "build/com.sktnugu.nugu_dbus_daemon.plist"
  end

  def plist_name
    "com.sktnugu.nugu_dbus_daemon"
  end

  def caveats
    <<~EOS
      To use dbus session bus, add the following to your .zshrc:

        export DBUS_SESSION_BUS_ADDRESS=unix:path=#{HOMEBREW_PREFIX}/var/run/nugu_dbus_daemon.sock
    EOS
  end

  plist_options startup: true

  test do
    system "true"
  end
end
