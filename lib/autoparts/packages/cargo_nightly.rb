# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class CargoNightly < Package
      name 'cargo-nightly'
      version '0.0.1-pre-nightly-3533ff1_2015-01-20'
      description 'Cargo build and dependency manager for Rust'
      category Category::DEVELOPMENT_TOOLS

      source_url 'https://static.rust-lang.org/cargo-dist/cargo-nightly-x86_64-unknown-linux-gnu.tar.gz'
      source_sha1 '9b1f9d57c9a6031113679ec7eb1dd7e259eab8a1'
      source_filetype 'tar.gz'

      def install
        Dir.chdir('cargo-nightly-x86_64-unknown-linux-gnu') do
          execute './install.sh', "--prefix=#{prefix_path}"
        end
      end
    end
  end
end

