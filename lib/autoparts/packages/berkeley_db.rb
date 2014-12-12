module Autoparts
  module Packages
    class BerkeleyDb < Package
      name 'berkeley_db'
      version '6.1.19'
      description 'Berkeley DB: a software library that provides a high-performance embedded database for key/value data.'
      source_url 'http://download.oracle.com/otn/berkeley-db/db-6.1.19.NC.tar.gz'
      source_sha1 'a87407eaa3051567d186bedd6c30f63166f06c54'
      source_filetype 'tar.gz'
      category Category::DATA_STORES

      def compile
        Dir.chdir('db-6.1.19.NC') do
          args = [
            "--prefix=#{prefix_path}",
          ]

          execute 'dist/configure', *args
          execute 'make'
        end
      end

      def install
         Dir.chdir('db-6.1.19.NC') do
          execute 'make', 'install'
        end
      end
    end
  end
end
