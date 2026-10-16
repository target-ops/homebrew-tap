# Mi-Lakach: household money for Israel, on your own computer. This installs the mi-lakach
# command; "mi-lakach install" then checks Docker and installs the app from ready images.
class MiLakach < Formula
  desc "Household money: bank and credit cards in one picture, on your own computer"
  homepage "https://milakach.ofir.dedyn.io"
  url "https://github.com/target-ops/homebrew-tap.git", branch: "main"
  version "0.3.1"
  license :cannot_represent

  def install
    bin.install "mi-lakach/mi-lakach"
  end

  def caveats
    <<~EOS
      Mi-Lakach runs in Docker. On a Mac: brew install --cask docker, then open Docker once.
      Then install and start it:
        mi-lakach install
    EOS
  end

  test do
    assert_match "mi-lakach #{version}", shell_output("#{bin}/mi-lakach version")
  end
end
