class LibnuguPlugins < Formula
  desc "Default Plugins for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/a5bffd0.tar.gz"
  version "1.7.3"
  sha256 "1d7846706201448156b9a6ba38535dcae6b785cc96ccd102f6da40b91052065b"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-plugins-1.7.3"
    sha256 cellar: :any, monterey: "6aa29b640972ce216963f03de0441b4f55733adb949e09a750ae09cc1d71e2cf"
    sha256 cellar: :any, big_sur:  "dba4605ade65d8440d4f87e9da7b43384f801f7966edc81fb0e9fe60a2bb0bf3"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-good"
  depends_on "gstreamer"
  depends_on "libnugu"
  depends_on "gst-plugins-ugly" => :recommended

  def install
    args = %w[
      -DENABLE_VENDOR_LIBRARY=OFF
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
