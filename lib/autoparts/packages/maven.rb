# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Maven < Package
      name 'maven'
      version '3.2.3'
      description 'Maven: A software project management and comprehension tool'
      source_url 'http://www.us.apache.org/dist/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz'
      source_sha1 '1ce6641f7dcb4fd5785bedcdca2979da83f6d23f'
      source_filetype 'tar.gz'
      category Category::DEVELOPMENT_TOOLS

      def install
        FileUtils.rm_rf prefix_path
        prefix_path.parent.mkpath
        execute 'mv', extracted_archive_path + "apache-maven-#{version}", prefix_path
        Dir.chdir(bin_path) do
          execute 'rm', 'mvn.bat'
          execute 'rm', 'mvnDebug.bat'
        end
      end
    end
  end
end