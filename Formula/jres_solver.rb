class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "3.0.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.1/jres_solver-v3_0_1-darwin-arm64.tar.gz"
      sha256 "d2632a6de2ec145b0ad3805c37a27c47a6bbabbf653644637aeb792daeb12c12"
    else
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.1/jres_solver-v3_0_1-darwin-x64.tar.gz"
      sha256 "720cfc8941a88ed750abc0cbdf3b552fa68e8277927afd8ab03dee0a5f0f4906"
    end
  end

  def install
    bin.install "bin/jres_solver", "bin/jres_formatter"
    lib.install "lib/libjres_solver.a"
  end

  test do
    system "#{bin}/jres_solver", "--help"
    system "#{bin}/jres_formatter", "--help"
  end
end
