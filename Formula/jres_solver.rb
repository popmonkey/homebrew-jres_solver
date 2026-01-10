class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "3.1.0"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.1.0/jres-solver-v3_1_0-darwin-arm64.tar.gz"
      sha256 "2262ff8dc29e09c7c51196412ce018d22479259b5c8e381605103884bfc4646c"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.1.0/jres-solver-v3_1_0-darwin-x64.tar.gz"
      sha256 "d535f0cd4a6b6c76528f974c6e10714fb471dd083ede0e362175e1f6d1d2fc26"
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
