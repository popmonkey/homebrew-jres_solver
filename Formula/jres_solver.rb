class JresSolver < Formula
  desc "JSON.Racing Endurance Schedule Solver"
  homepage "https://github.com/popmonkey/jres_solver_cpp"
  version "3.0.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.0/jres_solver-v3_0_0-darwin-arm64.tar.gz"
      sha256 "41012e624df6c78d6e6f7762d79acaa6bd6ebe7faa2dea71caf68ce0a3c4b083"
    else
      url "https://github.com/popmonkey/jres_solver_cpp/releases/download/v3.0.0/jres_solver-v3_0_0-darwin-x64.tar.gz"
      sha256 "576c17c865b4eae6160128bfa13dbd850074c8eb0786c018976ca7eed8d1b8ff"
    end
  end

  def install
    # If the tarball contains 'jres-solver-v3_0_0-darwin-arm64/bin/...'
    # Homebrew usually cd's into that single directory automatically.
    # To be safe and explicit, we define the prefix path.
    
    # Extract the platform-specific directory name logic
    arch_dir = OS.mac? && Hardware::CPU.arm? ? "darwin-arm64" : "darwin-x64"
    folder_name = "jres-solver-v#{version.to_s.gsub('.', '_')}-#{arch_dir}"

    # Change directory into the versioned folder if Homebrew didn't do it automatically
    cd folder_name do
      bin.install "bin/jres_solver", "bin/jres_formatter"
      lib.install "lib/libjres_solver.a"
    end
  end

  test do
    system "#{bin}/jres_solver", "--help"
    system "#{bin}/jres_formatter", "--help"
  end
end
