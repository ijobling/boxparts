module Autoparts
  module Packages
    class SwiProlog < Package
      name 'swi_prolog'
      version '6.6.6'
      description 'SWI-Prolog: a comprehensive free Prolog environment.'
      source_url 'http://www.swi-prolog.org/download/stable/src/pl-6.6.6.tar.gz'
      source_sha1 '38cc6772a48fd412f50fc06e24e6e4673eb71d3b'
      source_filetype 'tar.gz'
      category Category::PROGRAMMING_LANGUAGES
      
      def compile
        Dir.chdir('pl-6.6.6') do
          args = [
            "--prefix=#{prefix_path}"
          ]          
          execute './configure', *args
          execute 'make'
        end
      end
      
      def install
        Dir.chdir('pl-6.6.6') do
          execute 'make install'
        end
      end
      
    end
  end
end