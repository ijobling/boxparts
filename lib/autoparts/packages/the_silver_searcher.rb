# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class TheSilverSearcher < Package
      name 'the_silver_searcher'
      version '0.29.1'
      description 'The Silver Searcher: A code-searching tool similar to ack, with focus on speed'
      category Category::UTILITIES

      source_url 'http://geoff.greer.fm/ag/releases/the_silver_searcher-0.29.1.tar.gz'
      source_sha1 '056bc166adb84bb42d05328c44ff8b0b6ea5d393'
      source_filetype 'tar.gz'

      def install
        Dir.chdir('the_silver_searcher-0.29.1') do
          execute 'make', 'install'
        end
      end

      def compile
        Dir.chdir('the_silver_searcher-0.29.1') do
          execute 'aclocal'
          execute 'autoconf'
          execute 'autoheader'
          execute 'automake', '--add-missing'

          args = [
            '--disable-dependency-tracking',
            "--bindir=#{bin_path}",
            "--datarootdir=#{share_path}",
            "--prefix=#{prefix_path}",
            "--mandir=#{man_path}",
            "--docdir=#{doc_path}"
          ]

          execute './configure', *args
          execute 'make'
        end
      end
    end
  end
end
