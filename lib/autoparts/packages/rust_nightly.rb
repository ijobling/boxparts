# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class RustNightly < Package
      name 'rust-nightly'
      version '1.0.0-nightly-1d00c545e_2015-01-30'
      description 'Rust: A safe, concurrent, practical language'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'https://static.rust-lang.org/dist/rust-nightly-x86_64-unknown-linux-gnu.tar.gz'
      source_sha1 '883fbbd76890823ea8a672f1733f34061ebdd160'
      source_filetype 'tar.gz'

      def install
        Dir.chdir('rust-nightly-x86_64-unknown-linux-gnu') do
          execute './install.sh', "--prefix=#{prefix_path}"
        end
      end
    end
  end
end

