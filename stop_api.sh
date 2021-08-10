#!/bin/bash
#

whoami
pwd

echo source ~jbmull/.init_nvm
source ~jbmull/.init_nvm
echo back from ~jbmull/.init_nvm

# coloring includes escape sequences with left square brace,
# which screws up our awk stuff below...

echo calling forever
api_server_process=`forever --no-colors list | grep api-server.js`
echo Back from calling forever, api_server_process = $api_server_process
nchars=${#api_server_process}

if [ $nchars -eq 0 ]; then
	echo No API server process running, nothing to stop
	exit
fi

nlines=`echo $api_server_process | wc -l`
echo nlines = $nlines

if [ $nlines -gt 1 ]; then
	echo There appears to be more than one API server process running
fi

# The output looks like this:
# data: [1] f0Px /home/jbmull/.nvm/versions/node/v6.17.1/bin/node page-server.js 8355 8365 /home/jbmull/.forever/f0Px.log 0:0:0:4.638
#
# All we need is that 1 in brackets...

#echo api_server_process = $api_server_process
idx=`echo "$api_server_process" | awk -F"[][]" '{print $2}'`

echo Will stop forever job $idx
forever stop $idx

exit

