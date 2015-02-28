module Autoparts
  module Packages
    class Cppcheck < Package
      name 'cppcheck'
      version '1.68'
      description 'Cppcheck: Static source code analysis tool for C and C++ code.'
      category Category::DEVELOPMENT_TOOLS

      source_url 'http://sourceforge.net/projects/cppcheck/files/cppcheck/1.68/cppcheck-1.68.tar.bz2/download'
      source_sha1 '5f24fe9441cd558863c770e3b230dcfaaa3d93d0'
      source_filetype 'tar.bz2'

      def compile
        args = [
          "PREFIX=#{prefix_path}",
          "SRCDIR=build",
          "CFGDIR=cfg"
        ]
        
        Dir.chdir(name_with_version) do   
          execute 'make', *args
        end
      end

      def install
        args = [
          "PREFIX=#{prefix_path}"
        ]
        
        Dir.chdir(name_with_version) do 
          execute 'make', 'install', *args
        end
      end
    end
  end
end
