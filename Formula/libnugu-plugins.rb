class LibnuguPlugins < Formula
  desc "Default Plugins for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/refs/tags/v1.7.4.tar.gz"
  sha256 "56f481953f4f025a1cc35930be3fa5d3be0ea5cdd05ca14fe59d138037d1fd66"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-plugins-1.7.4"
    rebuild 3
    sha256 cellar: :any, arm64_monterey: "0b3842276fe11a285274037c294dea3529a46a20acd5ad261e2165855655703a"
    sha256 cellar: :any, monterey:       "7ce832aede5491d5351feec81e7d76a14678c7056dea05741bb127c41703c98c"
    sha256 cellar: :any, big_sur:        "254c6b87cce3e5957d3480e4719b1f8886b00f5f4131f1818cf1507c59117551"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "gstreamer"
  depends_on "libnugu"
  depends_on "libnugu-epd"

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
