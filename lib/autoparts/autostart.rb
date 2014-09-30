require 'json'

module Autoparts
  module Autostart
    class << self
      
      def start_all
        packages_names = read_autostart_file
        packages_names.each do |name|
          begin
            Commands::Start.start(name.to_s, true)
          rescue => e
            puts "#{e}\n"
          end
        end
      end

      def add(package)
        packages_names = read_autostart_file
        packages_names << package
        save_autostart_file packages_names
      end

      def del(package)
        packages_names = read_autostart_file
        packages_names.delete_if {|i| i == package}
        
        save_autostart_file packages_names
      end

      def list
        read_autostart_file
      end
      
      def print_list(json=false)
        packages_names = list
        if !json
          packages_names.each do |name|
            puts name
          end
        else
          puts JSON.generate packages_names
        end
      end

      def autostart_file_path
        Path.config_autostart_file
      end

      def save_autostart_file(packages_names)
        packages_names.uniq!
        File.open(autostart_file_path, 'w+') do |f|
          packages_names.each { |element| f.puts(element) }
        end
      end

      def read_autostart_file
        a = []
        if !autostart_file_path.exist?
          return a
        end
        
        File.open(autostart_file_path) do |f|
          f.each_line do |line|
            a << line.strip
          end
        end
        a.uniq!
        return a
      end
    end
  end
end
