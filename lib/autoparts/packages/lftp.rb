module Autoparts
  module Packages
    class Lftp < Package
      name 'lftp'
      version '4.6.1'

      description "Sophisticated command-line FTP/HTTP client programs"
      category Category::UTILITIES
      source_url 'http://lftp.yar.ru/ftp/lftp-4.6.1.tar.gz'
      source_sha1 '57b62d7365de1698433a3b1b5daf7192adc2517a'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir(name_with_version) do
          args = [
            "--prefix=#{prefix_path}",
            "--sysconfdir=#{Path.etc}",
          ]

          execute './configure', *args
          execute 'make'
        end
      end

      def install
        Dir.chdir(name_with_version) do
          execute 'make install'
          execute 'cp', conf_path, dist_conf_path # backup config
        end
      end

      def post_install
        execute 'cp', dist_conf_path, conf_path unless conf_path.exist? #put config
      end

      def purge
        conf_path.unlink
      end

      def conf_path
        Path.etc + 'lftp.conf'
      end

      def dist_conf_path
        prefix_path + 'lftp.conf'
      end

      def tips
        <<-STR.unindent
         Config path: #{conf_path}
        STR
      end
    end
  end
end
