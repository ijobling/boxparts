# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

# sqlite3 must be installed!!!
require File.join(File.dirname(__FILE__), 'python2')

module Autoparts
  module Packages
    class Python3 < Python2
      name 'python3'
      version '3.4.3'
      description 'Python 3: Next generation of the most friendly Programming Language'
      source_url 'https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz'
      source_sha1 '94cae02a334c72ea6ba8c056bb2864e2838878d3'
      source_filetype 'tgz'
      category Category::PROGRAMMING_LANGUAGES

      def common_version
        "3.4"
      end

      # requires a fix on version update
      def pre_compile
        execute 'sed', '-i', "1055 c\\        sqlite_inc_paths = [ '/usr/include', '#{Path.include}', ", 'setup.py'
      end

      def python_version
        "Python-3.4.3"
      end

      def required_env
        [
          "export PATH=${PATH}:#{bin_path}",
        ]
      end

      def pre_archive
          # do not remove pip and other tools
      end
    end
  end
end
