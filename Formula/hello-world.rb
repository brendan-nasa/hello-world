class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.4.tar.gz"
  sha256 "3658431c9b72f43f6bdb5ad8ddfff37a04d35ef08620b0813406cfbcbc438447"
  license "MIT"

  bottle do
    root_url "https://github.com/brendan-nasa/hello-world/releases/download/hello-world-0.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "0fb448a2e1e64fece884866164814f5433aec55dcc3a09734bd4c71d6e1b67d8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "33e00c6ab918b6c22dfcec365b8ce746e3a64cc75f1efcfba64ccdac3ae86028"
    sha256 cellar: :any_skip_relocation, sequoia:       "7967933afa94117f6a855dd278c057ba1b824c36b7dafe4a1939bf4facded050"
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
