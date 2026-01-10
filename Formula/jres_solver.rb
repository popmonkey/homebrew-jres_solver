class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "3.1.0"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.1.0/jres-solver-v3_1_0-darwin-arm64.tar.gz"
      sha256 "80b028d3354c514f7c3d15e99cbe77eca39d77bd31defba5676e2799c0b16d46"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.1.0/jres-solver-v3_1_0-darwin-x64.tar.gz"
      sha256 "66a5bd006a5b03bf7254f2c5beb990493e6d93c57e878db845885b93b4ab8b36"
    end
  end

  def install
    bin.install "bin/jres_solver", "bin/jres_formatter"
    lib.install "lib/libjres_solver.a" 
  end

  test do
    assert_match "Usage", shell_output("#{bin}/jres_solver --help", 1)
    assert_match "Usage", shell_output("#{bin}/jres_formatter --help", 1)
  end
end
