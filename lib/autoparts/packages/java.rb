module Autoparts
  module Packages
    class Java < Package
      name 'java'
      version '1.7.0'
      source_url ''
      description 'Java: the Java programming language'
      category Category::PROGRAMMING_LANGUAGES

      def tips
        <<-EOS.unindent
        Java 1.7.0 is preinstalled on all Codio Boxes.
        EOS
      end
    end
  end
end
