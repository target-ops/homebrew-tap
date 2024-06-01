class Tomatrix < Formula
  homepage "https://github.com/target-ops/homebrew-tap"
  version "0.0.4"
  url "https://github.com/target-ops/homebrew-tap.git", branch: "main", :using => :git
  head "https://github.com/target-ops/homebrew-tap.git", branch: "main", :using => :git
  desc "A small tap 🐐 to show matrix of target-ops "
  on_macos do
      if Hardware::CPU.arm?
        def install
          puts "A small tap 🐐 to show matrix of target-ops "
          installer_script = "matrixmaker/to-matrix.sh"
          bin.install installer_script
          system "chmod", "+x", "#{prefix}/bin/#{installer_script}"
          bin.install_symlink "#{prefix}/bin/#{installer_script}" => "toMatrix"
        end
      end
      if Hardware::CPU.intel?
        def install
          puts "A small tap 🐐 to show matrix of target-ops "
          installer_script = "matrixmaker/to-matrix.sh"
          bin.install installer_script
          system "chmod", "+x", "#{prefix}/bin/#{installer_script}"
          bin.install_symlink "#{prefix}/bin/#{installer_script}" => "toMatrix"
        end
      end
    end
end