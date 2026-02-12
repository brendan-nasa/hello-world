class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.2.tar.gz"
  sha256 "e7780db4453235a88a7669e94a73bfa0ff44725f99e5e8f85b6e99b397ae6c37"
  license "MIT"

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
