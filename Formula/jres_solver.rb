class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "0.10.2"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v0.10.2/jres-solver-v0_10_2-darwin-arm64.tar.gz"
      sha256 "4da688827eac99450ed471d0c68c8c6a7da333c8bf63b7a190db3c3bb972149f"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v0.10.2/jres-solver-v0_10_2-darwin-x64.tar.gz"
      sha256 "cf25358b5bcc7da58e5ad34d9baa6287b5b7701be3a8965f66774f769881f1ea"
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
