class LibnuguKwd < Formula
  desc "C/C++ library for NUGU SDK Keyword detector"
  homepage "https://github.com/nugulinux/nugu-kwd"
  url "https://github.com/nugulinux/nugu-kwd/releases/download/0.9.38ubuntu6/libnugu-kwd-src.tgz"
  sha256 "ad524e18328dde5f07381cfad56a62a03f11108db3696a7d1f72e7996e8257aa"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-kwd-0.9.38"
    rebuild 4
    sha256 cellar: :any, arm64_monterey: "25ff8d054c1bdac4f3800a8e3e20cad66da471763c2d9fda9d2288b00904a43b"
    sha256 cellar: :any, monterey:       "0346bcae90599a4453b48d5b7b6a59cfa31dc1c55434cc6a4c1bdc36ad63f49c"
    sha256 cellar: :any, big_sur:        "3a173aec95c08f301926522713a2762f3a3cd8ea26a53e424be8ea0f7ff033e2"
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
