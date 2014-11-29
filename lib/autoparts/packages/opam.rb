module Autoparts
  module Packages
    class Opam < Package
      name 'opam'
      version '1.2.0-20141129'
      description 'OPAM: a source-based package manager for OCaml. With "Real World OCaml" packages preinstalled.'
      source_url 'https://github.com/ocaml/opam/releases/download/1.2.0/opam-full-1.2.0.tar.gz'
      source_sha1 '27383e8001d42c1cae7d37ac47caccc397354fce'
      source_filetype 'tar.gz'
      category Category::DEVELOPMENT_TOOLS

      depends_on 'ocaml'
      depends_on 'aspcud'
      depends_on 'camlp4'

      def compile
        Dir.chdir(extracted_archive_path + 'opam-full-1.2.0') do

          args = [
            "--prefix=#{prefix_path}",
          ]
          ENV['MAKEFLAGS'] = '-j1'
         
          execute './configure', *args
          execute "make lib-ext"
          execute "make"
        end
      end

      def install
        FileUtils.mkdir_p(real_opam_home)
        execute 'ln', '-s', real_opam_home, user_opam_home
        Dir.chdir(extracted_archive_path + 'opam-full-1.2.0') do
          execute 'make install'
        end
        ENV['MAKEFLAGS'] = '-j1'
        install_libs
        execute 'rm', user_opam_home
      end

      def install_libs
        execute "#{bin_path}/opam init -y -a"
        libs = [
          'async',
          'yojson',
          'core_extended',
          'core_bench',
          'cohttp',
          'cryptokit',
          'menhir',
          'utop'
        ]
        libs.each do |lib|
          execute "eval `#{bin_path}/opam config env` && #{bin_path}/opam install -y #{lib}"
        end
      end

      def user_opam_home
        Path.home + '.opam'
      end

      def real_opam_home
        prefix_path + '.opam'
      end

      def post_install
        File.write(env_file, env_content)
        unless File.exist?("#{Path.home}/.ocamlinit")
          execute "curl https://gist.githubusercontent.com/avsm/9874360/raw/9290fa85bee7313b7acecc5393c669c522bb6a52/.ocamlinit >> #{Path.home}/.ocamlinit"
        end
        unless File.exist?(user_opam_home)
          execute 'ln', '-s', real_opam_home, user_opam_home
        end
      end

      def env_content
        <<-EOS.unindent
          eval `#{bin_path}/opam config env`
        EOS
      end

      def env_file
        Path.env + name
      end

      def post_uninstall
        user_opam_home.unlink if user_opam_home.symlink?
        env_file.unlink if env_file.exist?
      end

      def tips
        <<-EOS.unindent

        Close and open your terminal to have opam working properly after the install, or reload the shell with
          $ . ~/.bash_profile
        EOS
      end
    end
  end
end
