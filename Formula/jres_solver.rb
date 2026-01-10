class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "3.3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.3.0/jres-solver-v3_3_0-darwin-arm64.tar.gz"
      sha256 "be511c073750767f06073e6c03fc42afe466c47f5ca7261b04c956138f7dce54"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.3.0/jres-solver-v3_3_0-darwin-x64.tar.gz"
      sha256 "7b4949e3a2eda0093d80f3237802dd0649784d2d2116dc2cc53d7942ef622556"
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
