require 'unindent/unindent'

module Autoparts
  module Commands
    class Autostart
      def initialize(args, options)
        if args.empty?
          start_all 
          return
        end
        manage args[0], args[1], options
      rescue => e
        abort "parts: ERROR: #{e}\nAborting!"
      end          
      
      def start_all
        Autoparts::Autostart.start_all
      end
      
      def manage(command, package, options)
        Autoparts::Autostart.add package if command == 'add'
        Autoparts::Autostart.del package if command == 'del'
        json = options.include?('--json')
        Autoparts::Autostart.print_list(json) if command == 'list'

      end
    end
  end
end
