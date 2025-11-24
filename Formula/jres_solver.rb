class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "0.9.2"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v0.9.2/jres-solver-v0_9_2-darwin-arm64.tar.gz"
      sha256 "33d88e860898bfc641da81405a4d09e148728c6319b87a6de7cb832218cd3a71"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v0.9.2/jres-solver-v0_9_2-darwin-amd64.tar.gz"
      sha256 "4c5e186afde4b685d1292ce53ec75f9ab8ddb4a5b85ffe6cc75b106b8e528951"
    end
  end

  def install
    libexec.install Dir["*"]

    # 2. Create symlinks in /usr/local/bin that point to the libexec binaries
    bin.install_symlink libexec/"jres_solver"
    bin.install_symlink libexec/"jres_formatter"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/jres_solver --help", 1)
    assert_match "Usage", shell_output("#{bin}/jres_formatter --help", 1)
  end
end
