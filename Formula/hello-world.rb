class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.1.tar.gz"
  sha256 "9350d8d8bba408dbd3f4b80160daf116b0235f4627d32845bc14dd519b5356ff"
  license "MIT"
  revision 1

  depends_on "cmake" => :build

  def install
    system "cmake", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_equal "Hello, World!\n", shell_output("#{bin}/hello")
  end
end
