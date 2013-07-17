utilities
=========

## hosts.rb

Update hosts file on mac. Will only work if the dns alias already exists in the hosts file and is preceded by `#dns.alias` (immediately on the line above). Sample:

hosts file before (partial):
    #Virtual Hosts...
    #dns.alias
    192.168.1.999 dns.alias

Command:
    ./hosts.rb 192.168.1.111 dns.alias

hosts file after (partial):
    #Virtual Hosts...
    #dns.alias
    192.168.1.111 dns.alias
