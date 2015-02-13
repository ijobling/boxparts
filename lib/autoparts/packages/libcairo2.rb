module Autoparts
  module Packages
    class Libcairo2 < Package
      name 'libcairo2'
      version '1.12.18'
      description 'libcairo2: 2D graphics library with support for multiple output devices'
      category Category::LIBRARIES

      source_url 'http://cairographics.org/releases/cairo-1.12.18.tar.xz'
      source_sha1 'a76940b58da9c83b8934264617135326c0918f9d'
      source_filetype 'tar.xz'
      
      depends_on 'pixman'

      def name_with_version
        "cairo-#{version}"
      end

      def compile
        Dir.chdir(name_with_version) do
          args = [
            "--prefix=#{prefix_path}",
            ]
          execute './configure', *args
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
