module Autoparts
  module Packages
    class TagLib < Package
      name 'taglib' # The name of your Box Part (lower case)
      version '1.9.1' # Version of the component that will be  installed.
      description "TagLib Audio Meta-Data Library"
      category Category::LIBRARIES

      source_url 'http://taglib.github.io/releases/taglib-1.9.1.tar.gz'
      source_sha1 '4fa426c453297e62c1d1eff64a46e76ed8bebb45'
      source_filetype 'tar.gz'
      depends_on 'cmake'
      
      def compile
        Dir.chdir('taglib-1.9.1') do
          args = [
            "-DCMAKE_INSTALL_PREFIX=#{prefix_path}",
            "-DCMAKE_RELEASE_TYPE=Release",
            '.'
          ]
          execute 'cmake', *args
          execute 'make'
        end
      end

      def install
        Dir.chdir('taglib-1.9.1') do
          execute 'make install'
        end
      end    
    end
  end
end