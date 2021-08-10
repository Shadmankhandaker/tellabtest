#!/bin/bash
#

# make calls npm!
source ~jbmull/.init_nvm


# Running make is problematic when this script is
# called from /etc/rc.local - how can we make the environment
# the same???
#echo "start_tellab2.sh:  running make"
#make

make

echo "start_tellab2.sh:  starting http redirect"
./start_http_redirect.sh
echo "start_tellab2.sh:  starting page server"
./start_page_server.sh

exit

