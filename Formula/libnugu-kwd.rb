class LibnuguKwd < Formula
  desc "C/C++ library for NUGU SDK Keyword detector"
  homepage "https://github.com/nugulinux/nugu-kwd"
  url "https://github.com/nugulinux/nugu-kwd/releases/download/0.9.38ubuntu6/libnugu-kwd-src.tgz"
  sha256 "ad524e18328dde5f07381cfad56a62a03f11108db3696a7d1f72e7996e8257aa"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-kwd-0.9.38"
    rebuild 3
    sha256 cellar: :any, arm64_monterey: "a531b4f7168dced23960234770fbe33aae3897519e5a394c78706560e3d5f890"
    sha256 cellar: :any, monterey:       "bd084749a53dfca65350920c019f7a2f3213a65a93a6dd838fbfe6898008e678"
    sha256 cellar: :any, big_sur:        "c1bf6d4e23d16af0a01f1d458748da4e0cefcfff085d782858de75002329a75b"
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
