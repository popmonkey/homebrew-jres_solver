class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "2.1.1"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v2.1.1/jres-solver-v2_1_1-darwin-arm64.tar.gz"
      sha256 "b7c0d7a4911fd951499b37bd2062daac08cf493970b0b482785e64b9ec411d99"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v2.1.1/jres-solver-v2_1_1-darwin-x64.tar.gz"
      sha256 "f715b790922226d4e04bddcd4f7dc0434d2fe47fa599fe6b4608d0bcde04a9f9"
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
