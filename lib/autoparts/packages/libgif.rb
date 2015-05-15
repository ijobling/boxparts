module Autoparts
  module Packages
    class Libgif < Package
      name 'libgif'
      version '4.1.6'
      description 'GIFLIB: a package of portable tools and library routines for working with GIF images'
      category Category::LIBRARIES

      source_url 'http://ftp.de.debian.org/debian/pool/main/g/giflib/giflib_4.1.6.orig.tar.gz'
      source_sha1 '8649fa9c16f3300750f7089c79e652ddc750c832'
      source_filetype 'tar.gz'

      def name_with_version
        "giflib-#{version}"
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
