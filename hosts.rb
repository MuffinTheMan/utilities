#!/usr/bin/env ruby

require 'tempfile'
require 'fileutils'

next_line = false

path = '/etc/hosts'
temp_file = Tempfile.new('tmp_hosts')
begin
  File.open(path, 'r') do |file|
    file.each_line do |line|
      if line.strip == "#mms"
        temp_file.puts line
        next_line = true
      elsif next_line == true
        temp_file.puts "#{ARGV[0]} mms.dev"
        next_line = false
      else
        temp_file.puts line
      end
    end
  end
  temp_file.rewind
  FileUtils.mv(temp_file.path, path)
ensure
  temp_file.close
  temp_file.unlink
end

`dscacheutil -flushcache`
