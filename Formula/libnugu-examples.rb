class LibnuguExamples < Formula
  desc "Example applications for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/webispy/nugu-linux/archive/c0fd086.tar.gz"
  version "1.7.3"
  sha256 "95b7fdc3f8686ff8f736ed6337ea9eaa4ddd0fe0db6cc299a9f1cc4933cf2b68"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-examples-1.7.3"
    sha256 monterey: "1f21a5b5c3a9dfde2a51047a3dc26f8d0287b0cdeaccbcb07de02e067e493aea"
    sha256 big_sur:  "a35431d4bcfd066b6c3ee2800783d8177dc0fd2953fe8cf4c4d4c083337774f2"
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
