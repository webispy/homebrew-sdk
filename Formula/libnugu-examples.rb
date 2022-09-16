class LibnuguExamples < Formula
  desc "Example applications for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/a5bffd0.tar.gz"
  version "1.7.3"
  sha256 "1d7846706201448156b9a6ba38535dcae6b785cc96ccd102f6da40b91052065b"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-examples-1.7.3"
    rebuild 1
    sha256 monterey: "c86a84300f57d17dfc76ee2802d244118b04c734d93eede65e6e6ed40feb54b2"
    sha256 big_sur:  "b3f739a4fffda6d4cc9252e6ffb9694813ba7ac79f9bd03588fbc5885ebf4475"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libnugu"
  depends_on "libnugu-plugins"

  def install
    args = %w[
      -DENABLE_EXAMPLES_ONLY=ON
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
