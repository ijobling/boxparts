module Autoparts
  module Packages
    class Re2c < Package
      name 're2c'
      version '0.14'
      description 'Re2C: a tool for writing very fast and very flexible scanners.'
      category Category::LIBRARIES

      source_url 'http://sourceforge.net/projects/re2c/files/re2c/0.14/re2c-0.14.tar.gz/download'
      source_sha1 'caba94cbd4eb75d61e49b2b9f0ac17d0e53ae026'
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
