class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.4.tar.gz"
  sha256 "3658431c9b72f43f6bdb5ad8ddfff37a04d35ef08620b0813406cfbcbc438447"
  license "MIT"
  revision 6

  bottle do
    root_url "https://github.com/brendan-nasa/hello-world/releases/download/v0.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "292a63fd5abdc14bf41893be73226df9e18648e1cb62465371d882f8e4dbd80c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "34332c45c53a842084b84ffaf6d5269a2d3b86773547eded21a669945995f373"
    sha256 cellar: :any_skip_relocation, sequoia:       "799283c2a07b1589f4b45088490c487eaf95bc0ecc5b5f0a180836817da35c33"
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
