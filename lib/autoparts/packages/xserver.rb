module Autoparts
  module Packages
    class Xserver < Package
      name 'xserver'
      version '0.01'
      description 'Xserver: set of tools to run UI apps in Codio. (Beta)'
      category Category::UTILITIES

      source_url 'https://github.com/kanaka/noVNC/archive/master.zip'
      source_sha1 '94b2c2a1a3c9d382b64cbfab52b1001a97406fae'
      source_filetype 'zip'

      def install
        prefix_path.mkpath
        Dir.chdir('noVNC-master') do
          execute 'cp', '-R', './', vnc_path
        end
        Dir.chdir(vnc_path + 'utils') do
          execute 'git', 'clone', 'https://github.com/kanaka/websockify'
          execute 'rm', '-rf', 'websockify/.git'
        end
        Dir.chdir(vnc_path) do
          execute 'cp', 'vnc_auto.html', 'index.html'
        end
      end

      def vnc_path
        prefix_path + 'noVNC'
      end

      def start
        # start Xvfb
        xvfb_command = [
          'xvfb-run',
          "--auth-file=#{xAuthorityFile}",
          '--server-args="-screen 0 800x600x24"',
          '--auto-servernum',
          '--server-num=1',
          'openbox'
        ].join(' ')
        start_service xvfb_command, xPidFile

        ENV['DISPLAY'] = ":1"
        #ENV['XAUTHORITY'] = "#{xAuthorityFile}",

        vnc_command = [
          'x11vnc',
          '-listen', 'localhost',
          '-noncache',
          '-shared',
          '-forever'
          ]
         start_service vnc_command, vncPidFile
        start_service [proxy_path.to_s, '--listen', '9500'].join(' '), proxyPidFile
      end

      def logFile
        '/tmp/xserver.log'
      end

      def proxy_path
        vnc_path + 'utils' + 'launch.sh'
      end

      def start_service(cmd, pidFile)
        pidDir.mkpath
        pid = spawn *cmd, :out => logFile.to_s, :err => logFile.to_s
        Process.detach(pid)
        File.write pidFile,  pid
        sleep(1);
      end

      def running?
        if File.exists?(xPidFile)
          pid = File.read(xPidFile).strip
          if pid.length > 0 && `ps -o cmd= #{pid}`.include?('xvfb')
            return true
          end
          stop
        end
        false
      end

      def stop
        stop_service(proxyPidFile, 'noVNC')
        stop_service(vncPidFile, 'x11vnc')
        stop_service(xPidFile, 'xvfb')
        # ruby is stupid, have to kill process by name :(
        execute 'ps| grep openbox| awk \'{print $1}\' | xargs -r kill'
      end

      def stop_service(pidFile, service)
        if File.exists?(pidFile)
          pid = File.read(pidFile).strip
          if pid.length > 0 && `ps -o cmd= #{pid}`.include?(service)
            execute 'kill', '-TERM', pid
          end
          File.unlink(pidFile)
        end
      end

      def required_env
        [
          "export DISPLAY=:1",
          "export XAUTHORITY=#{xAuthorityFile}"
        ]
      end

      def pidDir
        Path.var + name + "run"
      end

      def xAuthorityFile
        pidDir + 'codio.auth'
      end

      def xPidFile
        pidDir + 'xfvb.pid'
      end

      def vncPidFile
        pidDir + 'x11vnc.pid'
      end

      def proxyPidFile
        pidDir + 'noVNC.pid'
      end

      def tips
        <<-EOS.unindent
        Run `parts start xserver` to start XServer and vnc server.
          # parts start xserver

        Important! Reopen your terminal to apply XServer environment variables for UI apps.

        Open your SSL Box preview url to connect to the screen.
        EOS
      end
    end
  end
end
