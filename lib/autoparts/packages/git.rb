module Autoparts
  module Packages
    class Git < Package
      name 'git'
      version '2.1.1'
      source_url ''
      description 'Git : source control management'
      category Category::DEVELOPMENT_TOOLS

      def tips
        <<-EOS.unindent
        Git 2.1.1 is preinstalled on all Codio Boxes.
        EOS
      end
    end
  end
end
