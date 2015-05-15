require 'autoparts/packages/php5_ext'


module Autoparts
  module Packages
    class Php5Phalcon < Package
      include Php5Ext

      name 'php5-phalcon'
      version '2.0.0'
      description 'Phalcon web framework.'
      source_url 'https://github.com/phalcon/cphalcon/archive/phalcon-v2.0.0.tar.gz'
      source_sha1 '118d17b285b03f1895db973a7836d93a56239f7e'
      source_filetype 'tar.gz'
      category Category::WEB_DEVELOPMENT

      depends_on 'php5'

      def php_extension_name
         "phalcon"
      end

      def php_extension_dir
         "cphalcon-phalcon-v2.0.0/build/64bits"
      end

      def php_compile_args
         ['--enable-phalcon']
      end
    end
  end
end
