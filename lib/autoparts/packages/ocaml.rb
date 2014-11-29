# do no forget to build camlp4 after ocaml update

module Autoparts
  module Packages
    class Ocaml < Package
      name 'ocaml'
      version '4.02.1'
      description 'OCaml: an industrial strength programming language supporting functional, imperative and object-oriented styles'
      source_url 'http://caml.inria.fr/pub/distrib/ocaml-4.02/ocaml-4.02.1.tar.gz'
      source_sha1 '6af8c67f2badece81d8e1d1ce70568a16e42313e'
      source_filetype 'tar.gz'
      category Category::PROGRAMMING_LANGUAGES


      def compile
        Dir.chdir(extracted_archive_path + name_with_version) do

          args = [
            "--prefix", "#{prefix_path}",
          ]
          execute './configure', *args

          execute "make -j 1 world bootstrap opt opt.opt"
        end
      end


      def install
        Dir.chdir(extracted_archive_path + name_with_version) do
          execute 'make', "PREFIX=#{prefix_path}", 'install'
        end
      end
    end
  end
end