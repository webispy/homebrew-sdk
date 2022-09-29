class LibnuguEpd < Formula
  desc "C/C++ library for NUGU SDK EndPoint detector"
  homepage "https://github.com/nugulinux/nugu-epd"
  url "https://github.com/nugulinux/nugu-epd/releases/download/2.1.11ubuntu5/libnugu-epd-src.tgz"
  sha256 "511ec9b5d08c55689eee7ee72412fb4cb29b87c644edeaf8b88f30cb48298af9"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-epd-2.1.11"
    rebuild 3
    sha256 cellar: :any, arm64_monterey: "0bf65fc13928a4e3126804ef093571ca1a0fde86bfc87921f5c56d8a277e5b87"
    sha256 cellar: :any, monterey:       "a077ec2836553320a5e19ffc777e94136ab9306a52602335c2ad6bf4a9ceb4b1"
    sha256 cellar: :any, big_sur:        "f57361c2f6169d6b69f86838dc702dfb38dd0f99f900036922944c19c8db3584"
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
