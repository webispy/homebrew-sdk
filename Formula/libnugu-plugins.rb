class LibnuguPlugins < Formula
  desc "Default Plugins for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/cac6425.tar.gz"
  version "1.7.3"
  sha256 "b19cc823732cf7ebecffc792e99d400b3173dc8b1fa1f28f7c112d5ede5b03f5"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-plugins-1.7.3"
    rebuild 2
    sha256 cellar: :any, arm64_monterey: "ba0a2d01db857a1b96f263a00ed5e73e70174f6bf2db57ff197cc38401060028"
    sha256 cellar: :any, monterey:       "332ea56c1f95593cec10ae688d6df994bd5603076730e932a91c8f31f45522da"
    sha256 cellar: :any, big_sur:        "ef70bb1af364e5dbf0435105a6ea5174cca5727b8d31b098dbb0d896a594fd5d"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-base"
  depends_on "gst-plugins-good"
  depends_on "gstreamer"
  depends_on "libnugu"
  depends_on "libnugu-epd"
  depends_on "gst-plugins-ugly" => :recommended

  def install
    args = %w[
      -DENABLE_PLUGINS_ONLY=ON
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
