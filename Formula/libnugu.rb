class Libnugu < Formula
  desc "C/C++ library for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/webispy/nugu-linux/archive/c0fd086.tar.gz"
  version "1.7.3"
  sha256 "95b7fdc3f8686ff8f736ed6337ea9eaa4ddd0fe0db6cc299a9f1cc4933cf2b68"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-1.7.3"
    sha256 cellar: :any, monterey: "124fb5fe5fdbd1028dfb9eac8a4184dfee6149cfcfdfe02c6e228a17b93f13c4"
    sha256 cellar: :any, big_sur:  "537b884f74835ec42e365a6a22a3a742050ea5b54369cf42759a46d2371b863b"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "glib"
  depends_on "jsoncpp"
  depends_on "openssl"

  def install
    args = %W[
      -DENABLE_VENDOR_LIBRARY=OFF
      -DENABLE_LIBRARY_ONLY=ON
      -DENABLE_BUILTIN_JSONCPP=OFF
      -DENABLE_BUILTIN_CURL=OFF
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
