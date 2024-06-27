class Mdbus2 < Formula
  desc "Mickey's DBus Introspection and Interaction Utility V2"
  homepage "https://github.com/webispy/mdbus"
  url "https://github.com/webispy/mdbus/archive/refs/heads/master.tar.gz"
  version "2.3.3"
  sha256 "96200281f96fce37a2f7823f10545ce33a31e73416544fd800d71cb5155292c6"
  license "GPL-2.0-only"

  # brew install --build-from-source --HEAD mdbus2
  head "https://github.com/webispy/mdbus.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/mdbus2-2.3.3"
    sha256 cellar: :any, arm64_sonoma: "ec62d6c0e839f53c6d79f397c32c771d38002804e4f7da4c4ef2e47ab64e33f7"
    sha256 cellar: :any, ventura:      "91016493fbb111ce46d15b375a00ad8f51a6f991dfea36ef19f5b3d2706a7bab"
    sha256 cellar: :any, monterey:     "9743d0b4e6eced9e96e2e39330d74ffdd235aa5b4763b8774719bd75b4bc3edb"
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
