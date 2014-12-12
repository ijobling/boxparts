module Autoparts
  module Packages
    class Boost < Package
      name 'boost'
      version '1.57.0'
      description 'Boost: a free peer-reviewed portable C++ source libraries.'
      category Category::LIBRARIES

      source_url 'http://sourceforge.net/projects/boost/files/boost/1.57.0/boost_1_57_0.tar.bz2/download'
      source_sha1 'e151557ae47afd1b43dc3fac46f8b04a8fe51c12'
      source_filetype 'tar.bz2'

      def compile
        Dir.chdir('boost_1_57_0') do
          args = [
            "--prefix=#{prefix_path}",
          ]
          execute 'sh', 'bootstrap.sh', *args
          execute './b2'
        end
      end


      def install
        Dir.chdir('boost_1_57_0') do
          execute './b2 install'
        end
      end
    end
  end
end
