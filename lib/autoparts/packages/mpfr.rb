module Autoparts
  module Packages
    class MPFR < Package
      name 'mpfr'
      version '3.1.2'
      description 'GNU MPFR: a C library for multiple-precision floating-point computations with correct rounding'
      category Category::LIBRARIES

      source_url 'http://www.mpfr.org/mpfr-current/mpfr-3.1.2.tar.gz'
      source_sha1 '5ef83b835fe0a8bf29b7929394633252673e0d67'
      source_filetype 'tar.gz'

      def compile
        args = [
          "--prefix=#{prefix_path}",
        ]
        
        Dir.chdir(name_with_version) do
          execute './configure', *args
          execute 'make'
        end
      end

      def install
        Dir.chdir(name_with_version) do
          execute 'make install'
          execute 'make check'          
        end
      end
    end
  end
end
