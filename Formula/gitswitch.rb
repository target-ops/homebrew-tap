# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Gitswitch < Formula
  desc ""
  homepage ""
  # url "https://github.com/target-ops/GitSwitch/archive/refs/tags/v0.1.0-alpha.tar.gz"
  url "https://github.com/target-ops/GitSwitch.git",branch: "main", :using => :git
  # sha256 "5d1dcd2a20729b965fa7d0a20373dce6c9fa623e2a9e7a6a8dbe2e9cf8046b2e"
  license ""
  version "0.1.0-alpha"
  # depends_on "cmake" => :build
  def install
    # Install the Python script
    prefix.install Dir["src"]
    chmod 0755, prefix/"src/main.py"
    
    # Install Python dependencies
    system "pip3", "install", "-r", "requirements.txt"
    
    # Create a symlink in bin
    # bin.install_symlink "python3 #{prefix}/src/main.py" => "gitswitch4"
    (bin/"gitswitch").write <<~EOS
    #!/bin/bash
    python3 #{prefix}/src/main.py "$@"
  EOS
  end
  test do
    system "false"
  end
end
