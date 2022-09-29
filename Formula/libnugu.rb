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
    rebuild 3
    sha256 cellar: :any, arm64_monterey: "2cb706c646db662a1c658579fcb1f01be3addd9107cdbc523bcccd3619fb97ea"
    sha256 cellar: :any, monterey:       "fab1ab04b51ed09aa431ab81c02f8da835fb249219f25bb0618ad6cbcb2b1c6b"
    sha256 cellar: :any, big_sur:        "7a6d3dd0c7b98ef363c6570d1d43517f1effdc0bd315b55235fe9cf0db773aa3"
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
