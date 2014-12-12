# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class CMake < Package
      name 'cmake'
      version '3.0.2'
      description 'CMake: A cross-platform, open-source build system'
      category Category::DEVELOPMENT_TOOLS

      source_url 'http://www.cmake.org/files/v3.0/cmake-3.0.2-Linux-i386.tar.gz'
      source_sha1 '144f4b56d451bea777eb43604eb1b9813ffa2ea6'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir('cmake-3.0.2') do
          execute './bootstrap', "--prefix=#{prefix_path}"
          execute 'make'
        end
      end

      def install
        Dir.chdir('cmake-3.0.2') do
          execute 'make install'
        end
      end
    end
  end
end
