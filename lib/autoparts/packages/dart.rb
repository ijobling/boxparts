module Autoparts
  module Packages
    class Dart < Package
      name 'dart'
      version '1.8.3'
      description 'Dart is a new platform for scalable web app engineering'
      source_url 'https://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/dartsdk-linux-x64-release.zip'
      source_sha1 '562c1101b702ead23e24f1652a5b7342935b2abd'
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

