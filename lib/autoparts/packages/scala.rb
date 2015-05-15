# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Scala < Package
      name 'scala'
      version '2.11.6'
      description 'Scala: An object-functional programming language'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'http://www.scala-lang.org/files/archive/scala-2.11.6.tgz'
      source_sha1 'f30ff4104b0fed5c4beca2b599b8f67e66b7f4e6'
      source_filetype 'tgz'

      def install
        prefix_path.parent.mkpath
        FileUtils.rm_rf prefix_path
        execute 'mv', extracted_archive_path + "scala-#{version}", prefix_path
      end
    end
  end
end
