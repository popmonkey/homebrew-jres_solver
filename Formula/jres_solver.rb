class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "9.1.0"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v1.0.0/jres-solver-1.0.0-macos-arm64.tar.gz"
      sha256 "5d01168d0a30cd89364496909d790bde028801d4f7281609897922dff2a3cc35"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v1.0.0/jres-solver-1.0.0-macos-x86_64.tar.gz"
      sha256 "28d95d7fe26d7ff4b6009c2a634a5b47cda5904fc6110f210cb35fee49c56989"
    end
  end

  def install
    # Install the binaries to the Homebrew bin path
    bin.install "solver"
    bin.install "formatter"
    
    lib.install Dir["libjres_solver.*"]
  end

  test do
    assert_match "Usage", shell_output("#{bin}/solver --help", 1)
    assert_match "Usage", shell_output("#{bin}/formatter --help", 1)
  end
end
