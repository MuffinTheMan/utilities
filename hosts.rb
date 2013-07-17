#!/usr/bin/env ruby

require 'tempfile'
require 'fileutils'

dns_alias = ARGV[1] ? ARGV[1] : 'mms.dev'
puts "Updating #{dns_alias} ip to #{ARGV[0]}"

next_line = false
found = false

path = '/etc/hosts'
temp_file = Tempfile.new('tmp_hosts')
begin
  File.open(path, 'r') do |file|
    file.each_line do |line|
      if line.strip == '#' << dns_alias
        temp_file.puts line
        next_line = true
      elsif next_line == true
        temp_file.puts "#{ARGV[0]} #{dns_alias}"
        next_line = false
        found = true
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

if found
  `dscacheutil -flushcache`
  puts "Success!"
else
  puts "Failed. No dns alias of *#{dns_alias}* found."
end
