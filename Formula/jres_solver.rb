class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "3.0.0"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.0/jres-solver-v3_0_0-darwin-arm64.tar.gz"
      sha256 "462c4876e09315fa09211ff43d4da9686c975802eabf4eb354ff277846ee24fd"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.0/jres-solver-v3_0_0-darwin-x64.tar.gz"
      sha256 "e9f0a762bffa418c2054f77abfc1904c1cd648180610056bf1384aa3e7795e16"
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
