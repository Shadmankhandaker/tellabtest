#!/bin/bash
#
# To stop:
# % forever list
# % forever stop 0	(note: 0 is used as an example)

echo start_page_server.sh BEGIN
date

source ~jbmull/.init_nvm


#make

cd pageServer
log_dir=..


source ~jbmull/.init_nvm

forever -o $log_dir/page_server_out.log -e $log_dir/page_server_err.log start page-server.js

exit

