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
    sha256 cellar: :any, arm64_sonoma: "e4299461b34c1931c5cf0929df299e73cf66df575a3d8f173e620df88fdcf6e5"
    sha256 cellar: :any, ventura:      "4266e63bb8ff2bdc74d213e4a2a7d5e8162630adf5222b520c1c21f1df3248de"
    sha256 cellar: :any, monterey:     "f4f4657b050f00e231911aa373c7d6c1c24ce402eb92edee649ff27ac4b1226e"
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
