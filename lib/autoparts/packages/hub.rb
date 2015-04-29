module Autoparts
  module Packages
    class Hub < Package
      name 'hub'
      version '2.2.1'
      description %q{ hub is a command line tool that wraps git in order to extend it with extra features 
                      and commands that make working with GitHub easier. }
      category Category::UTILITIES
      source_url 'https://github.com/github/hub/releases/download/v2.2.1/hub-linux-amd64-2.2.1.tar.gz'
      source_sha1 '198d0bdda7302531c306198fe45944bcffdf5d51'
      source_filetype 'tar.gz'


      def install
        bin_path.mkpath
        execute 'mv', extracted_archive_path.join('hub-linux-amd64-2.2.1', 'hub'), bin_path
      end
    end
  end
end
