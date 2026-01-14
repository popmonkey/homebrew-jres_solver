class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "3.0.4"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.4/jres_solver-v3_0_4-darwin-arm64.tar.gz"
      sha256 "53fc0ccf20059818bd42706ed4d1acc6d06f8015d5ab543dbe044f76313ed27d"
    else
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.4/jres_solver-v3_0_4-darwin-x64.tar.gz"
      sha256 "6a4732da5fac2c9e8be7ac84ed5894c92a357ebbada2fbfefa64394f53684d64"
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
