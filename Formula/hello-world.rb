class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.4.tar.gz"
  sha256 "3658431c9b72f43f6bdb5ad8ddfff37a04d35ef08620b0813406cfbcbc438447"
  license "MIT"
  revision 2

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "a5f44ce94d052c0decdc596054e0fc650fc9220648a04b34c7925552608f2508"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9b40cb1b689ba704137feff9949c16976a8b94be753af1ee85f23106b6ad1f40"
    sha256 cellar: :any_skip_relocation, sequoia:       "a467530af9cee0623e1b4ecb217bd1989b5680fd09c56ad00f6b2f323bbda3c3"
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
