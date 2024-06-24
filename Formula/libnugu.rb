class Libnugu < Formula
  desc "C/C++ library for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux.git",
    tag:      "v1.7.5",
    revision: "68363d7f73ec1e4f31c7dbdd3ca7926d8c29bb7c"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-1.7.5"
    sha256 cellar: :any, arm64_sonoma: "aa81fcd8ee4540bf6e9ef5c69279d2d025629d12f36c18f5e80f0be592625ab8"
    sha256 cellar: :any, ventura:      "4d1e3a8f8f76039c6371e3253197be648e08336d6a2bf5d33f1011d582e0067b"
    sha256 cellar: :any, monterey:     "7909e78b832cd39bf2fb5f9c8a8fe543f30804daf58b12cd0e1bdc030accb5c8"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "glib"
  depends_on "libnugu-epd"
  depends_on "libnugu-kwd"
  depends_on "openssl"
  depends_on "rapidjson"

  def install
    args = %W[
      -DENABLE_LIBRARY_ONLY=ON
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
