class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.4.tar.gz"
  sha256 "3658431c9b72f43f6bdb5ad8ddfff37a04d35ef08620b0813406cfbcbc438447"
  license "MIT"
  revision 5

  bottle do
    root_url "https://github.com/brendan-nasa/hello-world/releases/download/v0.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "3c1ce939da53a92767737a3735e44e2532d9a5d4e40e8d33aa72b59f624400df"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f08f2e927cfb81dc43a53d4b1669e587c4a0872669deb9932401d861f9706512"
    sha256 cellar: :any_skip_relocation, sequoia:       "2a50adc312dd9ac2fc9d7736faa1dff6e4f966de6a7dfe7fc82ccf82b44463c3"
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
