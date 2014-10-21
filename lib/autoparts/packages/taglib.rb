module Autoparts
  module Packages
    class Taglib < Package
      name 'taglib' # The name of your Box Part (lower case)
      version '1.9.1' # Version of the component that will be  installed.
      description "TagLib: a library for reading and editing the meta-data of several popular audio formats."
      category Category::LIBRARIES

      source_url 'http://taglib.github.io/releases/taglib-1.9.1.tar.gz'
      source_sha1 '4fa426c453297e62c1d1eff64a46e76ed8bebb45'
      source_filetype 'tar.gz'
      
      #compile time dependency
      #depends_on 'cmake'
      
      def compile
        Dir.chdir(name_with_version) do
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
        Dir.chdir(name_with_version) do
          execute 'make install'
        end
      end    
    end
  end
end