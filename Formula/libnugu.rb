class Libnugu < Formula
  desc "C/C++ library for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/742ca26.tar.gz"
  version "1.7.3"
  sha256 "b5d74620bd33f27118e3c30a5c27838a3b43e434b8640b58c6fef4674f6e6cd7"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-1.7.3"
    rebuild 4
    sha256 cellar: :any, arm64_monterey: "0f798396fc714d4e086c9cbe65e10c845ea5b99831e3e95313bd6b038cc20107"
    sha256 cellar: :any, monterey:       "a5d427411034601d2096add45f6087c12e1b844c2f51cb2dec37901a2abf3251"
    sha256 cellar: :any, big_sur:        "d96232c60cbdab85eb0b54fc5814d11cffb416f53fd472042c4577955f3aa963"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "glib"
  depends_on "jsoncpp"
  depends_on "libnugu-epd"
  depends_on "libnugu-kwd"
  depends_on "openssl"

  def install
    args = %W[
      -DENABLE_LIBRARY_ONLY=ON
      -DENABLE_BUILTIN_JSONCPP=OFF
      -DENABLE_BUILTIN_CURL=OFF
      -DENABLE_GSTREAMER_PLUGIN=OFF
      -DPLUGIN_DIR=#{HOMEBREW_PREFIX}/lib/nugu
      -DPACKAGING=ON
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
