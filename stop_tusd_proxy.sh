#!/bin/bash
#
# To stop:
# % forever list
# % forever stop 0	(note: 0 is used as an example)

echo ' '
echo 'Stopping tusd server'
echo ' '

source ~jbmull/.init_nvm


#make

cd pageServer
log_dir=..


source ~jbmull/.init_nvm

# coloring includes escape sequences with left square brace,
# which screws up our awk stuff below...

redirect_process=`forever --no-colors list | grep proxy-server.js`
len=${#redirect_process}

if [ $len -eq 0 ]; then
	echo No tusd proxy process running, nothing to stop
	exit
fi

#echo redirect_process = $redirect_process
#echo $redirect_process | od -c

# The output looks like this:
# data: [1] f0Px /home/jbmull/.nvm/versions/node/v6.17.1/bin/node redirect_http.js 8355 8365 /home/jbmull/.forever/f0Px.log 0:0:0:4.638
#
# All we need is that 1 in brackets...

idx=`echo "$redirect_process" | awk -F"[][]" '{print $2}'`

echo Will stop forever job $idx
forever stop $idx

exit

