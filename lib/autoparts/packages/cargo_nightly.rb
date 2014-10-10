# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class CargoNightly < Package
      name 'cargo-nightly'
      version '0.0.1-pre-nightly-861c07f_2014-10-07'
      description 'Cargo build and dependency manager for Rust'
      category Category::DEVELOPMENT_TOOLS

      source_url 'https://static.rust-lang.org/cargo-dist/cargo-nightly-x86_64-unknown-linux-gnu.tar.gz'
      source_sha1 '0a9eb52a520432374788520ce9add1d39005ffe8'
      source_filetype 'tar.gz'

      def install
        Dir.chdir('cargo-nightly-x86_64-unknown-linux-gnu') do
          execute './install.sh', "--prefix=#{prefix_path}"
        end
      end
    end
  end
end

