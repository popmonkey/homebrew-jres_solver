class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "2.2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v2.2.0/jres-solver-v2_2_0-darwin-arm64.tar.gz"
      sha256 "b98879110563a65c2a500db12a6c8ceffdaf9cd70c9023c44c6f7dd00719ccba"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v2.2.0/jres-solver-v2_2_0-darwin-x64.tar.gz"
      sha256 "2dd9a1e1a6917991d76754011d01640bb1356e6ff0e5d01209779cf10fd0b32a"
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
