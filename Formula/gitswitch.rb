class Gitswitch < Formula
  include Language::Python::Virtualenv

  desc ""
  homepage ""
  url "https://github.com/target-ops/GitSwitch.git", branch: "main", :using => :git
  license ""
  version "0.1.0-alpha"
  depends_on "python@3.9"

  def install
    # Create a virtual environment 
    venv = virtualenv_create(libexec, "python3")

    # Copy src directory and requirements.txt to libexec
    FileUtils.cp_r Dir["src"], libexec
    FileUtils.cp "requirements.txt", libexec

    # Install Python dependencies
    system libexec/"bin/python3", "-m", "pip", "install", "--verbose", "--no-deps", "--no-binary=:all:", "--ignore-installed", "--no-compile", "-r", libexec/"requirements.txt"
    
    # Make the script executable
    chmod 0755, libexec/"src/main.py"

    # Create a wrapper script
    (bin/"gitswitch").write <<~EOS
      #!/bin/bash
      #{libexec}/bin/python3 #{libexec}/src/main.py "$@"
    EOS
  end

  test do
    system "false"
  end
end