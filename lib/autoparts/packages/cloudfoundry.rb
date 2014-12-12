# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Cloudfoundry < Package
      name 'cloudfoundry'
      version 'v6.8.0'
      description 'Cloud Foundry: An open CLI for managing cloud services'
      category Category::DEPLOYMENT

      source_url 'https://cli.run.pivotal.io/stable?release=linux64-binary&version=6.8.0&source=github-rel'
      source_sha1 'f0ecd8c1dda45b523860fb64fbb892f242c2f0a1'
      source_filetype 'tgz'

      def install
        bin_path.parent.mkpath
        FileUtils.rm_rf bin_path

        execute 'mv', extracted_archive_path, bin_path
        execute 'chmod', '0755', cf_executable_path
      end

      def cf_executable_path
        bin_path + 'cf'
      end
    end
  end
end

