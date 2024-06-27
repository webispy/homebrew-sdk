class Mdbus2 < Formula
  desc "Mickey's DBus Introspection and Interaction Utility V2"
  homepage "https://github.com/webispy/mdbus"
  url "https://github.com/webispy/mdbus/archive/refs/heads/master.tar.gz"
  version "2.3.3"
  sha256 "96200281f96fce37a2f7823f10545ce33a31e73416544fd800d71cb5155292c6"
  license "GPL-2.0-only"

  # brew install --build-from-source --HEAD mdbus2
  head "https://github.com/webispy/mdbus.git", branch: "master"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "vala" => :build
  depends_on "glib"

  def install
    system "./autogen.sh", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "true"
  end
end
