class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "0.10.1"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v0.10.1/jres-solver-v0_10_1-darwin-arm64.tar.gz"
      sha256 "19b733c2e4dfdf093648cbe08813fbdcd09d368588e076baf4928b1a0967a891"
    else
      # Intel Mac
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v0.10.1/jres-solver-v0_10_1-darwin-x64.tar.gz"
      sha256 "04773b14f298744af7a5820d5952f939cf215d1ec901312be874be502ade0aea"
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
