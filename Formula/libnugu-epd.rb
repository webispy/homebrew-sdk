class LibnuguEpd < Formula
  desc "C/C++ library for NUGU SDK EndPoint detector"
  homepage "https://github.com/nugulinux/nugu-epd"
  url "https://github.com/nugulinux/nugu-epd/releases/download/2.1.11ubuntu7/libnugu-epd-src.tgz"
  sha256 "99ad543858eda0d68d89ffbe923f79d6d6480b072750127a8e96dde4590a8677"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-epd-2.1.11"
    rebuild 5
    sha256 cellar: :any, arm64_sonoma: "9897d0cf89e3512aeb020e3fb6afb8adeb0a05d5a6c9d9ffbd3d879f7a37cc31"
    sha256 cellar: :any, ventura:      "d2a161fd75572968fab4944611b28acce5a40f455104e465223e04d7aa466b50"
    sha256 cellar: :any, monterey:     "bd7e65558a3942fb82719a8e458fdb3efb8a72b7853fa039812a1dfb42b08f41"
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
