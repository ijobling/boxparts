# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class CMake < Package
      name 'cmake'
      version '3.0.2'
      description 'CMake: A cross-platform, open-source build system'
      category Category::DEVELOPMENT_TOOLS

      source_url 'http://www.cmake.org/files/v3.0/cmake-3.0.2.tar.gz'
      source_sha1 '379472e3578902a1d6f8b68a9987773151d6f21a'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir(name_with_version) do
          execute './bootstrap', "--prefix=#{prefix_path}"
          execute 'make'
        end
      end

      def install
        Dir.chdir(name_with_version) do
          execute 'make install'
        end
      end
    end
  end
end
