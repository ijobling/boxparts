module Autoparts
  module Packages
    class LFtp < Package
      name 'lftp' # The name of your Box Part (lower case)
      version '4.6.1' # Version of the component that will be  installed.

      description "Sophisticated command-line FTP/HTTP client programs"

      # Include a category for your part. A list of categories can be found in lib/autoparts/category.rb
      category Category::UTILITIES
      
      # The url of the source archive
      source_url 'http://lftp.yar.ru/ftp/lftp-4.6.1.tar.gz'

      # The sha1 hash of this source
      source_sha1 '57b62d7365de1698433a3b1b5daf7192adc2517a'

      # 'tar.gz' or 'zip'
      # Other filetypes are simply copied over without extraction.
      source_filetype 'tar.gz'

      ## Dependencies
      #depends_on 'php5' 
      # ^^ Not actually needed for MySQL, but added as an example.

      ## Optional compilation step
      def compile
        Dir.chdir('lftp-4.6.1') do
          args = [
            "--prefix=#{prefix_path}",
            "--bindir=#{bin_path}",
            "--sbindir=#{sbin_path}",
            "--libexecdir=#{libexec_path}",
            "--libdir=#{lib_path}",
            "--includedir=#{include_path}",
            "--sysconfdir=#{Path.etc}",
            "--mandir=#{man_path}",
            "--docdir=#{doc_path}",
            "--infodir=#{info_path}",
            "--datarootdir=#{share_path}",
          ]

          execute './configure', *args
          execute 'make'
        end
      end
      
      # Main installation step
      def install
        Dir.chdir('lftp-4.6.1') do
          execute 'make install'
        end
      end
    end
  end
end
