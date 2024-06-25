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
    rebuild 1
    sha256 arm64_sonoma: "59d51ea399907b63b04e996de4862a9aa467a7fdd224e1f8f6aabe5fe7051eec"
    sha256 ventura:      "05d9b878cbff6621383bea7f62c8d5620718112202befee922d8ceb5be250dce"
    sha256 monterey:     "c0a2429191947a8630c63ab1eaee59ded30e40931d309522c957acfb84f7a9b2"
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
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
