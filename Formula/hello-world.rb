class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.4.tar.gz"
  sha256 "3658431c9b72f43f6bdb5ad8ddfff37a04d35ef08620b0813406cfbcbc438447"
  license "MIT"
  revision 2

  bottle do
    root_url "https://github.com/brendan-nasa/hello-world/releases/download/v0.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "ce4786175a9eb6ccce50aad6ff7f39cb6deebc1998ce1f5d6771b075da77d632"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "095cf209ffd98be514cb16783c040ddebd3e735478ea6245001950c0cdb7b142"
    sha256 cellar: :any_skip_relocation, sequoia:       "41d1b65527ffc8575ec94560befc4e17962e49008c15ea3d17ceadcc42a3ef34"
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
