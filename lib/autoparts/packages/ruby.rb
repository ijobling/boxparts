module Autoparts
  module Packages
    class Ruby < Package
      name 'ruby'
      version '2.0.0'
      source_url ''
      description 'Ruby: a dynamic, open source programming language with a focus on simplicity and productivity'
      category Category::PROGRAMMING_LANGUAGES

      def tips
        <<-EOS.unindent
        Ruby and rbenv (Ruby Version Manager) are preinstalled on all Codio Boxes.
        EOS
      end
    end
  end
end
