class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "2.0.0"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v2.0.0/jres-solver-v2_0_0-darwin-arm64.tar.gz"
      sha256 "fcede9463a3dfa1bff4e7ddfdae4c869db4b611b9f349ff07d26f141ff10f3bc"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v2.0.0/jres-solver-v2_0_0-darwin-x64.tar.gz"
      sha256 "609ca5e71951d44818c549bf7a9b004af6a4faba4f6afe5384046b4ec488bf94"
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
