# must be installed before OPAM compilation

module Autoparts
  module Packages
    class Camlp4 < Package
      name 'camlp4'
      version '4.02.1'
      description 'Camlp4: a software system for writing extensible parsers for programming languages.'
      category Category::LIBRARIES

      source_url 'https://github.com/ocaml/camlp4/archive/4.02.1.zip'
      source_sha1 'a408b373fcf70b1e82c713887c22a7860caf9f2a'
      source_filetype 'zip'

      depends_on 'ocaml'

      def compile
        args = [
#          "--bindir=#{get_dependency("ocaml").bin_path}",
#          "--libdir=#{get_dependency("ocaml").lib_path}",
#          "--pkgdir=#{get_dependency("ocaml").lib_path}"
        ]
        
        Dir.chdir(name_with_version) do
          execute './configure', *args
          execute 'make -j 1 all'
        end
      end

      def install
        prefix_path.mkpath
        Dir.chdir(name_with_version) do
          execute 'make install'
        end
      end
    end
  end
end
