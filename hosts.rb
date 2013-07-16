#!/usr/bin/env ruby

if ARGV[0].length == 13
  next_line = false
  begin
    file = File.new("/etc/hosts", "r+")
    while (line = file.gets)
      if line.strip == "#mms"
        next_line = true
      elsif next_line == true
        file.seek(-line.length, IO::SEEK_CUR)
        file.write ARGV[0] 
        next_line = false
      end
    end
    file.close
  rescue => err
    puts "Exception: #{err}"
    err
  end

  `dscacheutil -flushcache`
end
