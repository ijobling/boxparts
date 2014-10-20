require 'autoparts/packages/php5_ext'

module Autoparts
  module Packages
    class Php5Gettext < Package
      include Php5Ext

      name 'php5-gettext'
      description 'Php5 gettext: functions implement an Native Language Support API.'
      category Category::WEB_DEVELOPMENT

      depends_on 'php5'

      def php_extension_name
        'gettext'
      end
    end
  end
end