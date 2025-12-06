class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "2.0.0"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v2.0.0/jres-solver-v2_0_0-darwin-arm64.tar.gz"
      sha256 "17210d3bc2544c3f0aef854310e015610171e4d833efd46794f7432d3d71b0a3"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v2.0.0/jres-solver-v2_0_0-darwin-x64.tar.gz"
      sha256 "37033649e4913cab73f636ec2ac587553b3007642e7b58275fd0c0f15d67221a"
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
