class Gitswitch < Formula
  include Language::Python::Virtualenv

  desc "Manage multiple Git identities (SSH keys, accounts, gh CLI) per vendor"
  homepage "https://github.com/target-ops/gitswitch"
  url "https://github.com/target-ops/gitswitch/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "a5259652efe3694c3f0661c25897ceac83b8668b7b4629a6478bcd9216f2ce5a"
  license "MIT"
  version "0.2.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")

    FileUtils.cp_r Dir["src"], libexec
    FileUtils.cp "requirements.txt", libexec

    system libexec/"bin/python3", "-m", "pip", "install",
           "--verbose", "--no-deps", "--no-binary=:all:",
           "--ignore-installed", "--no-compile",
           "-r", libexec/"requirements.txt"

    chmod 0755, libexec/"src/main.py"

    (bin/"gitswitch").write <<~EOS
      #!/bin/bash
      PYTHONPATH=#{libexec}/src #{libexec}/bin/python3 #{libexec}/src/main.py "$@"
    EOS
  end

  test do
    # Smoke test: the wrapper launches the venv'd Python and the click CLI loads.
    system bin/"gitswitch", "--version"
    assert_match "Easily manage multiple Git user profiles",
                 shell_output("#{bin}/gitswitch --help")
  end
end
