module Autoparts
  module Packages
    class Gcc < Package
      name 'gcc'
      version '4.8'
      source_url ''
      description 'gcc : C/C++ compiler'
      category Category::PROGRAMMING_LANGUAGES

      def tips
        <<-EOS.unindent
        gcc is preinstalled on all Codio Boxes.
        EOS
      end
    end
  end
end
