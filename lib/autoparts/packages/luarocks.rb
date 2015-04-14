# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Luarocks < Package
      name 'luarocks'
      version '2.2.0'
      description 'Luarocks: A package manager for Lua modules.'
      category Category::DEVELOPMENT_TOOLS

      source_url 'http://keplerproject.github.io/luarocks/releases/luarocks-2.2.0.tar.gz'
      source_sha1 'e2de00f070d66880f3766173019c53a23229193d'
      source_filetype 'tar.gz'

      depends_on "lua"

      def compile
        Dir.chdir('luarocks-2.2.0') do
          execute './configure', "--prefix=#{prefix_path}"
        end
      end

      def install
        Dir.chdir('luarocks-2.2.0') do
          execute 'make build'
          execute 'make install'
        end
      end

      def required_env
        [
          "export LUA_PATH=#{prefix_path}/share/lua/5.2/?.lua",
          "export LUA_CPATH=#{prefix_path}/lib/lua/5.2/?.so",
        ]
      end

      def tips
        <<-STR.unindent
         Close and open terminal to have luarocks working after the install.
         or reload shell with
         . ~/.bash_profile
        STR
      end

    end
  end
end