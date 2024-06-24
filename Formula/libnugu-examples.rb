class LibnuguExamples < Formula
  desc "Example applications for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux.git",
    tag:      "v1.7.5",
    revision: "68363d7f73ec1e4f31c7dbdd3ca7926d8c29bb7c"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/webispy/homebrew-sdk/releases/download/libnugu-examples-1.7.5"
    sha256 cellar: :any, arm64_sonoma: "589dc0c924daf2ff744bc05c6f5ecb5d9a7e0947b350998ffd36a5320877ddbf"
    sha256 cellar: :any, ventura:      "854b8665ec55990628be69dc46dc16c3ba540d95d4060742c3aa6e260ec65b83"
    sha256 cellar: :any, monterey:     "8f647e0672d26c6bcc78ee06e7fa94580c6c593fbce3c1ece7f693b33a606677"
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
