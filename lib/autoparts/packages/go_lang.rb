module Autoparts
  module Packages
    class GoLang < Package
      name 'go-lang'
      version '1.4'
      description 'Go: an open source programming language that makes it easy to build simple, reliable, and efficient software.'
      source_url 'http://golang.org/dl/go1.4.linux-amd64.tar.gz'
      source_sha1 'cd82abcb0734f82f7cf2d576c9528cebdafac4c6'
      source_filetype 'tar.gz'
      category Category::PROGRAMMING_LANGUAGES

      def install
        Dir.chdir('go') do
          prefix_path.mkpath
          go_packages.mkpath
          execute 'rm', '-rf', 'manual', 'INSTALL'
          execute "mv * #{prefix_path}"
        end
      end

      def env_file
        Path.env + 'go-lang'
      end

      def required_env
        env_file.unlink if env_file.exist?
        [
          "export GOROOT=#{prefix_path}",
          "export GOPATH=#{go_packages}",
          "export PATH=$PATH:$GOPATH/bin",
        ]
      end

      def go_packages
        Path.home + 'workspace'
      end

      def tips
        <<-EOS.unindent

         Close and open terminal to have go-lang working after the install.
         or reload shell with
         . ~/.bash_profile
        EOS
      end
    end
  end
end
