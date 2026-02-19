class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.4.tar.gz"
  sha256 "3658431c9b72f43f6bdb5ad8ddfff37a04d35ef08620b0813406cfbcbc438447"
  license "MIT"
  revision 9

  bottle do
    root_url "https://github.com/brendan-nasa/hello-world/releases/download/v0.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "dc0ff94fcedd057fee9cdc40579b68cf376766ea9afde839d47bd864a293766e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4df2c5e439bfb736690a3117bbf665f7f68a2122b09da71c2bfe2cfe166f053e"
    sha256 cellar: :any_skip_relocation, sequoia:       "5f719c1bb9b3f8c3d4081832cec3b17fd510401585c19eb1e3b641f6cdb0ff2e"
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
