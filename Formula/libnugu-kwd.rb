class LibnuguKwd < Formula
  desc "C/C++ library for NUGU SDK Keyword detector"
  homepage "https://github.com/nugulinux/nugu-kwd"
  url "https://github.com/nugulinux/nugu-kwd/releases/download/0.9.38ubuntu6/libnugu-kwd-src.tgz"
  sha256 "ad524e18328dde5f07381cfad56a62a03f11108db3696a7d1f72e7996e8257aa"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-kwd-0.9.38"
    sha256 cellar: :any, arm64_sonoma: "5a0475214947af6cf168eab5dae38d59a0e6089d9ebec8ed5cc4a45ee89ce8b6"
    sha256 cellar: :any, ventura:      "5c403a2d894465d07c1b2146cf362597d480609b356d2422c17924acde925e01"
    sha256 cellar: :any, monterey:     "1d2116462e71a861209f38bbf9426e6787ad65dd143cdf0d8ae3f865164e80bd"
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
