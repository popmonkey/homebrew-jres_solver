class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "0.10.0"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v0.10.0/jres-solver-v0_10_0-darwin-arm64.tar.gz"
      sha256 "ba255395a32a666e903f40fb45f2a6bacec0bb6078ae332a1bd2f718855c0245"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v0.10.0/jres-solver-v0_10_0-darwin-x64.tar.gz"
      sha256 "7220a3a2bcd3048c6788b7852410babbb97ca5e3fdce72dedaf0abbf464250f6"
    end
  end

  def install
    libexec.install Dir["*"]

    # 2. Create symlinks in /usr/local/bin that point to the libexec binaries
    bin.install_symlink libexec/"jres_solver"
    bin.install_symlink libexec/"jres_formatter"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/jres_solver --help", 1)
    assert_match "Usage", shell_output("#{bin}/jres_formatter --help", 1)
  end
end
