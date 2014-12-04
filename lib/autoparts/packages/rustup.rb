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

      def rustup_executable
        prefix_path + 'rustup.sh'
      end
      
      def install
        bin_path.mkpath
        execute 'mv', archive_filename, rustup_executable
        execute 'chmod', '0755', rustup_executable
      end
      
      def pre_archive
        rust_uninstall
      end
      
      def rustc_bin
        bin_path + 'rustc'
      end
      
      def post_install
        rust_uninstall
        execute rustup_executable, "--prefix=#{prefix_path}"
      end
      
      def rust_uninstall
        return if !rustc_bin.exist?
        execute rustup_executable, "--prefix=#{prefix_path}", "--uninstall"
      end

    end
  end
end

