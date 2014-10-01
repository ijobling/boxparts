module Autoparts
  module Packages
    class Node < Package
      name 'node'
      version '0.10.25'
      source_url ''
      description 'NodeJS: server-side Javascript using non-blocking event-driven I/O model'
      category Category::PROGRAMMING_LANGUAGES

      def tips
        <<-EOS.unindent
        NodeJS and NVM (Node Version Manager) are preinstalled on all Codio Boxes.
        EOS
      end
    end
  end
end
