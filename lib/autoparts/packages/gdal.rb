module Autoparts
  module Packages
    class Gdal < Package
      name 'gdal'
      version '1.11.1-1'
      description 'GDAL: a translator library for raster and vector geospatial data formats.'
      source_url 'http://download.osgeo.org/gdal/1.11.1/gdal-1.11.1.tar.gz'
      source_sha1 'e2c67481932ec9fb6ec3c0faadc004f715c4eef4'
      source_filetype 'tar.gz'
      category Category::LIBRARIES
      
#      depends_on "python2"
      
      def compile
        Dir.chdir("gdal-1.11.1") do
          args = [
            "--prefix=#{prefix_path}",
            "--with-python"
          ]          
          execute './configure', *args
          execute 'make'
        end
      end
      
      def install
        Dir.chdir("gdal-1.11.1") do
          execute 'make install'
        end
      end
      
    end
  end
end