class LibnuguPlugins < Formula
  desc "Default Plugins for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux.git",
    tag:      "v1.7.6",
    revision: "06461dbf3e6cdbc94d47a80412290a449c0dc5fc"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-plugins-1.7.5"
    sha256 cellar: :any, arm64_sonoma: "bd041ec49360f26db18be55407fd9e6df719566d9f210ff4843688ce1f8a00c6"
    sha256 cellar: :any, ventura:      "67b7c80b159c2c98ed8ac839f0f2eacf2394d3377090e7166e97a495c26ee539"
    sha256 cellar: :any, monterey:     "9d16cf0697fb15404121fae59ea71f3d8d64dcd7d77017b45f49b68d9933f77a"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "gstreamer"
  depends_on "libnugu"
  depends_on "libnugu-epd"
  depends_on "opus"

  def install
    args = %w[
      -DENABLE_PLUGINS_ONLY=ON
      -DENABLE_BUILTIN_PLUGIN=OFF
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
