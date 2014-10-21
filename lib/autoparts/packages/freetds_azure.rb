module Autoparts
  module Packages
    class FreetdsAzure < Package
      name 'freetds_azure'
      version '0.91'
      description %{FreeTDS: a set of libraries for Unix and Linux that allows your programs to natively
                    talk to Microsoft SQL Server and Sybase databases.}
      source_url 'ftp://ftp.freetds.org/pub/freetds/stable/freetds-stable.tgz'
      source_sha1 '3ab06c8e208e82197dc25d09ae353d9f3be7db52'
      source_filetype 'tar.gz'
      category Category::LIBRARIES

      def install
        Dir.chdir('freetds-0.91') do
          execute 'make', 'install'
        end
      end

      def compile
        Dir.chdir('freetds-0.91') do
          args = [
            "--prefix=#{prefix_path}",
            '--enable-msdblib',
            '--with-openssl=/usr/bin/openssl',
            '--with-tdsver=7.1'
          ]
          execute './configure',  *args
          execute 'make'
        end
      end

    end
  end
end
