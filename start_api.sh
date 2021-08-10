#!/bin/bash
#

echo start_api.sh BEGIN

if [[ -z $TELLAB_ADMIN_USER ]]; then
	echo TELLAB_ADMIN_USER is not defined
	exit 1
fi

admin_home=`eval echo "~$TELLAB_ADMIN_USER"`

echo admin_home = $admin_home

# this was here twice?
whoami
source $admin_home/.init_nvm

make

# Hopefully we will be done with this soon!
#PERFORM_KLUDGE=1
#export PERFORM_KLUDGE

cd apiServer

forever -o ../api_server_out.log -e ../api_server_err.log start api-server.js

