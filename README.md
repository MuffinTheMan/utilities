utilities
=========

## hosts.rb

Update hosts file on mac. Will only work if the dns alias already exists in the hosts file and is preceded by `#dns.alias` (immediately on the line above). Sample hosts:

    #Virtual Hosts...
    #dns.alias
    192.168.1.999 dns.alias

`./hosts.rb 192.168.1.999 test.com` sets the virtual host ip for 'test.com' and runs a flush
