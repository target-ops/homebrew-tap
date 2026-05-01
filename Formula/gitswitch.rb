class Gitswitch < Formula
  desc "Stop committing as the wrong person — directory-bound git identities"
  homepage "https://github.com/target-ops/gitswitch"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/target-ops/gitswitch/releases/download/v1.0.0/gitswitch-1.0.0-darwin-arm64.tar.gz"
      sha256 "b4e8e0998e5d4e94a54f2a8c8074b387c538ba91f010cd29a7d7e6947b446a3a"
    else
      url "https://github.com/target-ops/gitswitch/releases/download/v1.0.0/gitswitch-1.0.0-darwin-amd64.tar.gz"
      sha256 "6eb61c920c3f98c8d0f146b8531ef77b9641db23802e98d485e15b937e66367e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/target-ops/gitswitch/releases/download/v1.0.0/gitswitch-1.0.0-linux-arm64.tar.gz"
      sha256 "b0e9ee6ee41ff904cff84c52a51691dfc65606bcb0dc0c84f1952713163001d0"
    else
      url "https://github.com/target-ops/gitswitch/releases/download/v1.0.0/gitswitch-1.0.0-linux-amd64.tar.gz"
      sha256 "a0c469781acccb1bf53336082182c6213d6d6681c02d945d4a1f1f3da537a521"
    end
  end

  def install
    bin.install "gitswitch"
  end

  test do
    # Smoke check: the binary launches and reports the expected version.
    assert_match version.to_s, shell_output("#{bin}/gitswitch --version")
    # And the headline commands all register with cobra.
    help = shell_output("#{bin}/gitswitch --help")
    %w[init use guard doctor why].each do |cmd|
      assert_match cmd, help
    end
  end
end
