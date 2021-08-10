#!/bin/bash

# To stop:
# % forever list
# % forever stop 0	(note: 0 is used as an example)

echo ' '
echo 'Starting tusd proxy server'
echo ' '

source ~jbmull/.init_nvm


cd uploadServer/proxy

log_dir=../..


source ~jbmull/.init_nvm

forever -o $log_dir/proxy_out.log -e $log_dir/proxy_err.log start proxy-server.js

