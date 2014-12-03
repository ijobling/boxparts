# Copyright (c) 2014 Graham Cox <graham@grahamcox.co.uk>
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/sazzer/boxparts/master/LICENSE).

module Autoparts
  module Packages
    class RustUp < Package
      name 'rustup'
      version 'latest'
      description 'Rust: A safe, concurrent, practical language, using the rustup.sh script for bleeding-edge installs'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'https://static.rust-lang.org/rustup.sh'
      source_filetype 'sh'

      def install
        File.chmod(0755, "./rustup-latest.sh")
        execute './rustup-latest.sh', "--prefix=#{prefix_path}"
      end
      
      def uninstall
        File.chmod(0755, "./rustup-latest.sh")
        execute './rustup-latest.sh', "--prefix=#{prefix_path}", "--uninstall"
      end

    end
  end
end

