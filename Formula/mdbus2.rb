class Mdbus2 < Formula
  desc "Mickey's DBus Introspection and Interaction Utility V2"
  homepage "https://github.com/webispy/mdbus"
  url "https://github.com/webispy/mdbus/archive/refs/heads/master.tar.gz"
  version "2.3.3"
  sha256 "96200281f96fce37a2f7823f10545ce33a31e73416544fd800d71cb5155292c6"
  license "GPL-2.0-only"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/webispy/mdbus.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/mdbus2-2.3.3"
    sha256 cellar: :any, monterey: "b39c8061bd5c964f858fe462bad0eac57b8fbd3c15a44e50b66a50a05b1916e8"
    sha256 cellar: :any, big_sur:  "64ba38ba9b652039912f059d92d5767782ca6e46619ae099ffa16208108b827b"
  end

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
