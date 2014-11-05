module Autoparts
  module Packages
    class Dart < Package
      name 'dart'
      version '1.7.2'
      description 'Dart is a new platform for scalable web app engineering'
      source_url 'http://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/dartsdk-linux-x64-release.zip'
      source_sha1 '309b17e42043bcfb7ff70da285e40e8d4726c58f'
      source_filetype 'zip'
      category Category::PROGRAMMING_LANGUAGES

      def install
        prefix_path.mkpath
        Dir.chdir(extracted_archive_path + 'dart-sdk') do
          execute 'cp', '-r', '.', prefix_path
        end
      end
    end
  end
end

