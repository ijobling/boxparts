module Autoparts
  module Packages
    class Libsdl < Package
      name 'libsdl'
      version '1.2.15'
      description 'SDL: A cross-platform development library designed to provide low level access to
                  audio, keyboard, mouse, joystick, and graphics hardware via OpenGL and Direct3D'
      category Category::LIBRARIES

      source_url 'https://www.libsdl.org/release/SDL-1.2.15.tar.gz'
      source_sha1 '0c5f193ced810b0d7ce3ab06d808cbb5eef03a2c'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir("SDL-#{version}") do
          args = [
            "--prefix=#{prefix_path}"
          ]
          execute './configure', *args
          execute 'make'
        end
      end


      def install
        Dir.chdir("SDL-#{version}") do
          execute 'make install'
        end
      end
    end
  end
end
