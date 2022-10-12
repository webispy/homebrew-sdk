class Mdbus2 < Formula
  desc "Mickey's DBus Introspection and Interaction Utility V2"
  homepage "https://github.com/webispy/mdbus"
  url "https://github.com/webispy/mdbus/archive/17b0747.tar.gz"
  version "2.3.3"
  sha256 "b8f0afa5a37840c8e38f9b354e4426f57313a4917197a549f18058a6e6b3cc4b"
  license "GPL-2.0-only"

  # brew install --build-from-source --HEAD libnugu
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
