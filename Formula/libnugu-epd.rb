class LibnuguEpd < Formula
  desc "C/C++ library for NUGU SDK EndPoint detector"
  homepage "https://github.com/nugulinux/nugu-epd"
  url "https://github.com/nugulinux/nugu-epd/releases/download/2.1.11ubuntu5/libnugu-epd-src.tgz"
  sha256 "511ec9b5d08c55689eee7ee72412fb4cb29b87c644edeaf8b88f30cb48298af9"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-epd-2.1.11"
    rebuild 2
    sha256 cellar: :any, arm64_monterey: "1ba32f6c0f311261926505f50f27f4f1ce12d0268be04e65d2561c112c44a248"
    sha256 cellar: :any, monterey:       "68aa2b38ef2cd87d317ed1b1c19d4287637875b64da41ae37d5e2093bd330022"
    sha256 cellar: :any, big_sur:        "a3c63bad2990267ed71f714a969f1bc88c144611d8a185951fc7156294390229"
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
