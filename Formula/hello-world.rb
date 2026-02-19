class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.3.tar.gz"
  sha256 "1f41b33bd6925a2ebae807375703984f78e104aa6b8c25591e77c3e0e9091a3b"
  license "MIT"

  bottle do
    root_url "https://github.com/brendan-nasa/hello-world/releases/download/hello-world-0.2"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "492c6467c576dbff889246160782d4a5d19427a112a5d30c48a8c588c6df99d3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a6c539a149a50112ed41bb57ea6eb0c3f9ca039ec40fa0f6a27138c2e145a275"
    sha256 cellar: :any_skip_relocation, sequoia:       "bba0c1464a44743a10a63efde00529c02d54e0420756364ae1d5204f438b852a"
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_equal "Hello, MARS!\n", shell_output("#{bin}/hello")
  end
end
