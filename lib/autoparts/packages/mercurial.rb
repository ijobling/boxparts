module Autoparts
  module Packages
    class Mercurial < Package
      name 'mercurial'
      version '2.0.2'
      source_url ''
      description 'Mercurial : source control management'
      category Category::DEVELOPMENT_TOOLS

      def tips
        <<-EOS.unindent
        Mercurial 2.0.2 is preinstalled on all Codio Boxes.
        EOS
      end
    end
  end
end
