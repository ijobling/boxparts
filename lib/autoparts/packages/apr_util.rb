# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class AprUtil < Package
      name 'apr_util'
      version '1.5.4'
      description 'Apache Portable Runtime Utilities: Utilities that provide a predictable and consistent interface to underlying platform-specific implementations'
      category Category::UTILITIES

      source_url 'http://apache.mirrors.timporter.net//apr/apr-util-1.5.4.tar.gz'
      source_sha1 '72cc3ac693b52fb831063d5c0de18723bc8e0095'
      source_filetype 'tar.gz'

      depends_on "apr"

      def compile
        Dir.chdir('apr-util-1.5.4') do
          args = [
            "--with-apr=#{get_dependency("apr").prefix_path}",
            "--prefix=#{prefix_path}",
            "--bindir=#{bin_path}",
            "--sbindir=#{bin_path}",
            "--sysconfdir=#{Path.etc}",
            "--libdir=#{lib_path}",
            "--includedir=#{include_path}",
            "--datarootdir=#{share_path}/#{name}",
            "--datadir=#{share_path}/#{name}",
            "--mandir=#{man_path}",
            "--docdir=#{doc_path}",
          ]
          prefix_path.mkpath
          execute './configure', *args
          execute 'make'
        end
      end

      def install
        Dir.chdir('apr-util-1.5.4') do
          execute 'make install'
        end
      end
    end
  end
end
