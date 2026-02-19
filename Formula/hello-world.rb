class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.4.tar.gz"
  sha256 "3658431c9b72f43f6bdb5ad8ddfff37a04d35ef08620b0813406cfbcbc438447"
  license "MIT"
  revision 9

  bottle do
    root_url "https://github.com/brendan-nasa/hello-world/releases/download/v0.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "1cf5c6410ebce22b69c46780ca73fe6c93c40ac76bad2d88a2d20fab2ce028b5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "883805b125262a3f4a0d191261b26f69cefb2618d2d7170faf70e97cd334dbae"
    sha256 cellar: :any_skip_relocation, sequoia:       "6e06800e59aa55733289974c23c95556b1d0f29d0a42ec9ad35790300a079870"
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
