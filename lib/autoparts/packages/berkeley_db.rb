module Autoparts
  module Packages
    class BerkeleyDb < Package
      name 'berkeley_db'
      version '6.1.23'
      description 'Berkeley DB: a software library that provides a high-performance embedded database for key/value data.'
      source_url 'http://download.oracle.com/berkeley-db/db-6.1.23.NC.tar.gz'
      source_sha1 'dbad47a95cc29cfc03d152f2b2f7ae8637489997'
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
