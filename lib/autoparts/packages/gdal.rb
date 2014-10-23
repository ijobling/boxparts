# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

# All python packages should be rebuild on version change.
module Autoparts
  module Packages
    class Gdal < Package
      name 'gdal'
      version '1.11.1'
      description 'GDAL - Geospatial Data Abstraction Library'
      source_url 'http://download.osgeo.org/gdal/1.11.1/gdal-1.11.1.tar.gz'
      source_sha1 'e2c67481932ec9fb6ec3c0faadc004f715c4eef4'
      source_filetype 'tar.gz'
      category Category::LIBRARIES
      
      def compile
        Dir.chdir("gdal-1.11.1") do
          execute './configure'
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