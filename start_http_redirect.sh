#!/bin/bash
#
# To stop:
# % forever list
# % forever stop 0	(note: 0 is used as an example)

source ~jbmull/.init_nvm


#make

cd pageServer
log_dir=..


source ~jbmull/.init_nvm

forever -o $log_dir/redir_out.log -e $log_dir/redir_err.log start redirect_http.js

