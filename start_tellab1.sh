#!/bin/bash

# There is no development database for tellab1...

source ~jbmull/.init_nvm

# This rule is now in /etc/rc.local, so it should not need
# to be run...
#sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3000

#dev_host='js-17-45.jetstream-cloud.org'
dev_host='lab2.tellab.org'
this_host=`hostname`
#if [ $this_host = $dev_host ]; then
#	TELLAB_MODE=development
#else
	TELLAB_MODE=production
#fi

echo Starting TELLab1, will connect to $TELLAB_MODE database
export TELLAB_MODE

source ~jbmull/.init_nvm

cd ~jbmull/tellab

forever tellab1_app.js > tellab1_output 2> tellab1_errors &
 
