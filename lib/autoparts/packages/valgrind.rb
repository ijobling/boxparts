module Autoparts
  module Packages
    class Valgrind < Package
      name 'valgrind'
      version '3.10.0'
      description 'Valgrind: a system for debugging and profiling Linux programs.'
      category Category::DEVELOPMENT_TOOLS

      source_url 'http://valgrind.org/downloads/valgrind-3.10.0.tar.bz2'
      source_sha1 'aec0b8cd042ec36c8cce4f6027b98627ab202f26'
      source_filetype 'tar.bz2'

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
        end
      end
    end
  end
end
