module Autoparts
  module Packages
    class Pixman < Package
      name 'pixman'
      version '0.32.6'
      description 'pixman: a low-level software library for pixel manipulation, providing features such as image compositing and trapezoid rasterization.'
      category Category::LIBRARIES

      source_url 'http://cairographics.org/releases/pixman-0.32.6.tar.gz'
      source_sha1 '8791343cbf6d99451f4d08e8209d6ac11bf96df2'
      source_filetype 'tar.gz'

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
