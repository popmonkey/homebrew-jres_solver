class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "2.0.0"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v2.0.0/jres-solver-v2_0_0-darwin-arm64.tar.gz"
      sha256 "b52126684850446fe72b9da91563dbd41c7b4dda244c9764544f586e16685f8b"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v2.0.0/jres-solver-v2_0_0-darwin-x64.tar.gz"
      sha256 "a4a841d829a45345db1c518c60fb08d36377828eaccee25078a0b80921b7a0fc"
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
