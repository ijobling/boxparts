# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Ack < Package
      name 'ack'
      version '2.14'
      description 'Ack: A tool like grep, optimized for programmers'
      category Category::UTILITIES

      source_url 'http://beyondgrep.com/ack-2.14-single-file'
      source_sha1 '49c43603420521e18659ce3c50778a4894dd4a5f'
      source_filetype 'pl'

      def install
        bin_path.mkpath
        execute 'mv', archive_filename, ack_executable_path
        execute 'chmod', '0755', ack_executable_path
        execute 'ln', '-s', ack_executable_path, (bin_path + 'ack-grep')
      end

      def ack_executable_path
        bin_path + 'ack'
      end
    end
  end
end
