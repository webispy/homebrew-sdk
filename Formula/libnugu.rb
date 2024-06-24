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
    rebuild 1
    sha256 cellar: :any, arm64_sonoma: "aee1a105c4161fab8cebfc96a797b2dc08bd3d5cd6c9d5ab3bc5d8a3e13e3c8e"
    sha256 cellar: :any, ventura:      "b02cd5df3c78e3d502a1870beb2fda6483e57a23b79cda5607778927fe1be2b7"
    sha256 cellar: :any, monterey:     "c13e6895989a595cd9dc3d6791388d112045e5e631ad348337c4757618843e32"
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
