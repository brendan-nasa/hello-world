class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.4.tar.gz"
  sha256 "3658431c9b72f43f6bdb5ad8ddfff37a04d35ef08620b0813406cfbcbc438447"
  license "MIT"

  bottle do
    root_url "https://github.com/brendan-nasa/hello-world/releases/download/hello-world-0.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "80c7b048c1624ec3051056cc00b4d67cf3c2586d226f95ced673be7de2c260de"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bcb1107810d0328a8bb537970ca34181854f6610d6bb1a53de22c7596a322e57"
    sha256 cellar: :any_skip_relocation, sequoia:       "c8abca1c004e2520ddd0c41347c51ff43c841b00ff7954382b7311f9debd3dbf"
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
