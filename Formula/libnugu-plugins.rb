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
    rebuild 1
    sha256 cellar: :any, monterey: "c728d5776c6aa4bc70d4a3ab6d22f590cd6371fc798c509c5a0d795c7726ae60"
    sha256 cellar: :any, big_sur:  "f06d51ae89731b275a32ee014da4185906919b49ad57da401d88fb72903190ef"
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
