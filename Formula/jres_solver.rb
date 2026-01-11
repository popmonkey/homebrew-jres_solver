class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "3.0.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.2/jres_solver-v3_0_2-darwin-arm64.tar.gz"
      sha256 "950c2c95d50f37433f87f460ea7e350f687939f6ead17e3d0e6a6b8ba45d06d9"
    else
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.2/jres_solver-v3_0_2-darwin-x64.tar.gz"
      sha256 "eb43f3a550808d5fa263f0feac2bbb7a412603055111222fdf91d5473222259d"
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
