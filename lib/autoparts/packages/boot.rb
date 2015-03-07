# Copyright (c) 2015 Degree9 Solutions Inc.
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Boot < Package
      name 'boot'
      version '2.0.0-rc11'
      description 'Boot: Build tooling for Clojure.'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'https://github.com/boot-clj/boot/releases/download/2.0.0-rc11/boot.sh'
      source_sha1 '4ba53216f97b9bbf5de2064eaa0f5d6cf9a8e378'
      source_filetype 'sh'

      def install
        prefix_path.mkpath

        bin_path.mkpath
        execute 'mv', archive_filename, boot_executable_path
        execute 'chmod', '0755', boot_executable_path
      end

      def boot_executable_path
        bin_path + "boot"
      end
    end
  end
end
