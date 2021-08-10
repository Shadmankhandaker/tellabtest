#!/bin/bash

# add these commands to /etc/rc.local

# from this article:
# https://coderwall.com/p/plejka/forward-port-80-to-port-3000

# Two rules, one for prerouting and one for output:

http_redirect_port=3000
https_port=3010

iptables -t nat -I OUTPUT     -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports $http_redirect_port
iptables -t nat -I PREROUTING -p tcp              --dport 80 -j REDIRECT --to-ports $http_redirect_port

iptables -t nat -I OUTPUT     -p tcp -d 127.0.0.1 --dport 443 -j REDIRECT --to-ports $https_port
iptables -t nat -I PREROUTING -p tcp              --dport 443 -j REDIRECT --to-ports $https_port


# # This command shows the rules with line numbers:
# % sudo iptables -L -t nat -v --line-numbers
# 
# # This command deletes rule line 1:
# % sudo iptables -t nat -D PREROUTING 1

