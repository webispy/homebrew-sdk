class LibnuguExamples < Formula
  desc "Example applications for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/742ca26.tar.gz"
  version "1.7.3"
  sha256 "b5d74620bd33f27118e3c30a5c27838a3b43e434b8640b58c6fef4674f6e6cd7"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-examples-1.7.3"
    rebuild 3
    sha256 cellar: :any, arm64_monterey: "5fef9fa2ee7621f25c63f778c9f0e7d9e5073cc321d4cd27a9748918f2d2baba"
    sha256 cellar: :any, monterey:       "b1225812094cfb914b6b6266beae78e619c157ae69a437f215ffaffe8f9b1ca6"
    sha256 cellar: :any, big_sur:        "e0df56ff31466c3245df7e7dc8c9a7462f4d1811aed51393cd3d90dd518b4e96"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libnugu"
  depends_on "libnugu-plugins"

  def install
    args = %W[
      -DENABLE_EXAMPLES_ONLY=ON
      -DPACKAGING=ON
      -DASSET_DIR=#{Formula["libnugu"].share}/nugu
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
