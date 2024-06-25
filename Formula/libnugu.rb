class Libnugu < Formula
  desc "C/C++ library for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux.git",
    tag:      "v1.7.6",
    revision: "06461dbf3e6cdbc94d47a80412290a449c0dc5fc"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-1.7.6"
    rebuild 2
    sha256 arm64_sonoma: "23a0324b59904f5dc4a7fabe4f965d6b08ded423d776510786909eebcf2a2f61"
    sha256 ventura:      "4c52692f461cec7d9ef7a3b32f7c8f3232ac3b4bb2a0bc9cc1517a9d24489fdf"
    sha256 monterey:     "abc9150bf0b03207defd880540dfb8922b75cefe785f76b23e4d890cfa5d0c12"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "glib"
  depends_on "gstreamer"
  depends_on "libnugu-epd"
  depends_on "libnugu-kwd"
  depends_on "openssl"
  depends_on "opus"
  depends_on "rapidjson"

  def install
    args = %W[
      -DENABLE_BUILTIN_CURL=OFF
      -DPLUGIN_DIR=#{lib}/nugu
      -DPACKAGING=ON
      -DCMAKE_INSTALL_RPATH=#{rpath}
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
