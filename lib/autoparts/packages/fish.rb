# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Fish < Package
      name 'fish'
      version '2.1.2'
      description 'fish: A friendly interactive shell'
      category Category::SHELLS

      source_url 'http://fishshell.com/files/2.1.2/fish-2.1.2.tar.gz'
      source_sha1 'f7f8d8d26721833be3458b8113c74b747296ec0b'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir(name_with_version) do
          args = %W[
            --prefix=#{prefix_path}
            --sysconfdir=#{Path.etc}
          ]
          execute './configure', *args
          execute 'make'
        end
      end

      def install
        Dir.chdir(name_with_version) do
          bin_path.mkpath
          execute 'make install'
        end
      end
    end
  end
end
