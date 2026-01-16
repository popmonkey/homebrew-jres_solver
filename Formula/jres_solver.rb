class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "3.1.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.1.1/jres_solver-v3_1_1-darwin-arm64.tar.gz"
      sha256 "d43523d6543444ceaf61e527b6bc3091442d22c3c6c30cf72ea119ff399dbf1d"
    else
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.1.1/jres_solver-v3_1_1-darwin-x64.tar.gz"
      sha256 "a6e286bca30619fd37560c01e2906e0ac1fe4725e5574daaef0581f11dba1441"
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
