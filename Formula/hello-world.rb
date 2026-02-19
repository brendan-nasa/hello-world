class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.4.tar.gz"
  sha256 "3658431c9b72f43f6bdb5ad8ddfff37a04d35ef08620b0813406cfbcbc438447"
  license "MIT"
  revision 7

  bottle do
    root_url "https://github.com/brendan-nasa/hello-world/releases/download/v0.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "161a24b13b8e19dd67b5222e9bec5454f72e504247ea33430ec089ae128759c1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6bc1ffbf02739db117b3f9f786e6f64038d4365ea0d7b16b775dc23623070691"
    sha256 cellar: :any_skip_relocation, sequoia:       "aa225f1beebc9114ba30838ea7e4e2c6c9770325f22ab0e853f36958b4921646"
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_equal "Hello, Enceladus!\n", shell_output("#{bin}/hello")
  end
end
