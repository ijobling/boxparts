# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Rust < Package
      name 'rust'
      version '1.0.0-alpha2'
      description 'Rust: A safe, concurrent, practical language'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'https://static.rust-lang.org/dist/rust-1.0.0-alpha.2-x86_64-unknown-linux-gnu.tar.gz'
      source_sha1 'e29c047e6a49693f4a474dc8903aa52361a30ce9'
      source_filetype 'tar.gz'

      def install
        Dir.chdir('rust-1.0.0-alpha.2-x86_64-unknown-linux-gnu') do
          execute './install.sh', "--prefix=#{prefix_path}"
        end
      end
    end
  end
end
