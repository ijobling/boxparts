module Autoparts
  module Packages
    class Haskell < Package
      name 'haskell-platform'
      version '2014.2.0.0'
      description 'Haskell is an advanced purely-functional programming language.'
      source_url 'http://www.haskell.org/platform/download/2014.2.0.0/haskell-platform-2014.2.0.0-srcdist.tar.gz'
      source_sha1 '745c57f6305c48adb87ce97723f95a3aeff92b38'
      source_filetype 'tar.gz'
      category Category::PROGRAMMING_LANGUAGES

      depends_on 'ghc'
      depends_on 'cabal'
      
      def ghc_tar_url
        "https://www.haskell.org/ghc/dist/7.8.3/ghc-7.8.3-x86_64-unknown-linux-deb7.tar.bz2"
      end
      
      def ghc_tar_path
         Path.tmp + 'ghc.tar.bz2'
      end
      
      def compile
        execute 'wget', '-O', ghc_tar_path, ghc_tar_url

        Dir.chdir(name_with_version) do
          args = [
            '-j 2',
            "--prefix=#{prefix_path}",
            ghc_tar_path
          ]
          
          execute './platform.sh', *args
          execute 'rm', ghc_tar_path
        end
      end

#       def install
#         Dir.chdir(name_with_version) do
#           execute 'make', 'install'
#         end
#       end
    end
  end
end
