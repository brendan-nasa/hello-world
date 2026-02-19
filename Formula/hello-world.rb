class HelloWorld < Formula
  desc "Repo test brew test repo"
  homepage "https://github.com/brendan-nasa/hello-world"
  url "https://github.com/brendan-nasa/hello-world/archive/refs/tags/v0.4.tar.gz"
  sha256 "3658431c9b72f43f6bdb5ad8ddfff37a04d35ef08620b0813406cfbcbc438447"
  license "MIT"
  revision 5

  bottle do
    root_url "https://github.com/brendan-nasa/hello-world/releases/download/v0.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "fa2175e0481200ccdb12857d4729711d6b65cd0380eae9b371511d85daab31e1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ff1644f93873c0447474051b6e92f42e35de369176190f123fa9b6e3ad6a18e6"
    sha256 cellar: :any_skip_relocation, sequoia:       "b33c1a926c3d92c404376b871a51a5f903cd902711c79254aeff3654dbc16293"
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
