class LibnuguEpd < Formula
  desc "C/C++ library for NUGU SDK EndPoint detector"
  homepage "https://github.com/nugulinux/nugu-epd"
  url "https://github.com/nugulinux/nugu-epd/releases/download/2.1.11ubuntu7/libnugu-epd-src.tgz"
  sha256 "99ad543858eda0d68d89ffbe923f79d6d6480b072750127a8e96dde4590a8677"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-epd-2.1.11"
    rebuild 4
    sha256 cellar: :any, arm64_sonoma: "e90b34ec38078fa0bc73d698c0f0d26741d7170b8925eafea7c36ec37ceb85cd"
    sha256 cellar: :any, ventura:      "1cad824fcc042c318ff89977f98f5cb4c3c793301265db5ca8aa75e4ea49de42"
    sha256 cellar: :any, monterey:     "8ae053ff2b9eee062045b379d762b174a5980eac03b2acea191225cf545dd352"
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
