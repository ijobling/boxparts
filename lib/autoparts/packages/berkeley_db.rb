module Autoparts
  module Packages
    class BerkeleyDb < Package
      name 'berkeley_db'
      version '6.1.19'
      description 'Berkeley DB: a software library that provides a high-performance embedded database for key/value data.'
      source_url 'http://download.oracle.com/berkeley-db/db-6.1.19.NC.tar.gz'
      source_sha1 '009ef0094d2600c2966c530a3d130f0220f848d3'
      source_filetype 'tar.gz'
      category Category::DATA_STORES

      def name_with_version
        "db-#{version}.NC"
      end
      
      def compile
        Dir.chdir(name_with_version) do
          args = [
            "--prefix=#{prefix_path}",
          ]

          execute 'dist/configure', *args
          execute 'make'
        end
      end

      def install
         Dir.chdir(name_with_version) do
          execute 'make', 'install'
        end
      end
    end
  end
end
