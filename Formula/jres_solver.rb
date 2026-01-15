class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "3.1.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.1.0/jres_solver-v3_1_0-darwin-arm64.tar.gz"
      sha256 "4f0fed66cdabe93dd601dc6ec45c9889bfde2d3355cad9aeb816daa3417dff2a"
    else
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.1.0/jres_solver-v3_1_0-darwin-x64.tar.gz"
      sha256 "3323bb6f1bc05bceb127ed046ece864d698481921a7a9ba360aa6da4604626ac"
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
