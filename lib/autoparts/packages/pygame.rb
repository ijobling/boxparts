module Autoparts
  module Packages
    class Pygame < Package
      name 'pygame'
      version '1.9.1'
      description 'PyGame: A set of Python modules designed for writing games.'
      category Category::LIBRARIES

      source_url 'http://www.pygame.org/ftp/pygame-1.9.1release.tar.gz'
      source_sha1 'a45aeb0623e36ae7a1707b5f41ee6274f72ca4fa'
      source_filetype 'tar.gz'

      depends_on 'python3'
      depends_on 'libsdl'

      def install
        prefix_path.mkpath
        Dir.chdir("pygame-1.9.1release") do
          execute 'sed -i "s|raw_input|input|g" setup.py'
          execute 'python3', 'setup.py', 'install'
        end
        required_files.each do |f|
          execute "mv",
            python_dependency.site_packages + f,
            prefix_path + f
        end
      end

      def post_uninstall
        required_files.each do |f|
          path = python_dependency.site_packages + f
          FileUtils.rm_rf(path) if path.exist? 
        end
      end

      def post_install
        required_files.each do |f|
          execute "cp", "-rf",
            prefix_path + f,
            python_dependency.site_packages + f
        end
      end

      def python_dependency
        @python ||= get_dependency("python3")
      end

      def required_files
        [
          "pygame",
          "pygame-1.9.1release-py3.4.egg-info",
        ]
      end
    end
  end
end
