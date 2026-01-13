class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "3.0.3"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.3/jres_solver-v3_0_3-darwin-arm64.tar.gz"
      sha256 "6b3aead505855917a8481f6159fcdea57f6b86bf640f6ada681b7f02dc6dd80a"
    else
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.3/jres_solver-v3_0_3-darwin-x64.tar.gz"
      sha256 "27ced7abf228c6c7ab2866aaf410bbb42935e044d97cef7f903b568dba74e587"
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
