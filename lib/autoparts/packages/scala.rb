# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Scala < Package
      name 'scala'
      version '2.11.4'
      description 'Scala: An object-functional programming language'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'http://www.scala-lang.org/files/archive/scala-2.11.4.tgz'
      source_sha1 'a6d319b26ccabe9c609fadebc32e797bf9cb1084'
      source_filetype 'tgz'

      def install
        prefix_path.parent.mkpath
        FileUtils.rm_rf prefix_path
        execute 'mv', extracted_archive_path + "scala-#{version}", prefix_path
      end
    end
  end
end
