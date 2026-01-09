class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "3.0.0"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.0/jres-solver-v3_0_0-darwin-arm64.tar.gz"
      sha256 "68fb491d9a6a4c84df04190d61d2acfa87ab9f9d7b24721a4e3a9078c96166a2"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.0/jres-solver-v3_0_0-darwin-x64.tar.gz"
      sha256 "5b451f8b6bc7977e5f12e50c732b0ccd83f6374921bb6703aa93cab46c9c51d8"
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
