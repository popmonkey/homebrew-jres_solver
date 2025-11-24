class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "0.9.2"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v0.9.2/jres-solver-v0_9_2-darwin-arm64.tar.gz"
      sha256 "923854fa8a7f2822cf1061ef243c0b6facfafa288e3b27e7088b93295c83e494"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v0.9.2/jres-solver-v0_9_2-darwin-amd64.tar.gz"
      sha256 "d5fe23ec02069c9d79c6f065fadbd7cc1ba879f3be3ff31ece20818ddeba94e8"
    end
  end

  def install
    # Install the binaries to the Homebrew bin path
    bin.install "solver"
    bin.install "formatter"
    
    lib.install Dir["libjres_solver.*"]
  end

  test do
    assert_match "Usage", shell_output("#{bin}/jres_solver --help", 1)
    assert_match "Usage", shell_output("#{bin}/jres_formatter --help", 1)
  end
end
