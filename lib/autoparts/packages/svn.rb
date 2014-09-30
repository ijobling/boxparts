module Autoparts
  module Packages
    class Svn < Package
      name 'svn'
      version '1.6.17'
      source_url ''
      description 'SVN : source control management'
      category Category::DEVELOPMENT_TOOLS

      def tips
        <<-EOS.unindent
        SVN 1.6.17 is preinstalled on all Codio Boxes.
        EOS
      end
    end
  end
end
