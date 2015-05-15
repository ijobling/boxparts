# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Jq < Package
      name 'jq'
      version '1.4'
      description 'Jq: A lightweight and flexible command-line JSON processor.'
      category Category::UTILITIES

      source_url 'http://stedolan.github.io/jq/download/linux64/jq'
      source_sha1 'e820e9e91c9cce6154f52949a3b2a451c4de8af4'
      source_filetype 'c'

      def install
        bin_path.mkpath
        execute 'mv', archive_filename, jq_executable_path
        execute 'chmod', '0755', jq_executable_path
      end

      def jq_executable_path
        bin_path + 'jq'
      end
    end
  end
end
