class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "1.0.0"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v1.0.0/jres-solver-v1_0_0-darwin-arm64.tar.gz"
      sha256 "2e928ea03ed2f34f2eec917473f2e03266fb7407f17ba9dda1870f5b5a1f948b"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v1.0.0/jres-solver-v1_0_0-darwin-x64.tar.gz"
      sha256 "8c0d069f49759542a3d61442f4be8110b9f2c3fad93b480065fbf25ff5b1aa26"
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
