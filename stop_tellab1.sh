#!/bin/bash
#
# To stop:
# % forever list
# % forever stop 0	(note: 0 is used as an example)


source ~jbmull/.init_nvm

# coloring includes escape sequences with left square brace,
# which screws up our awk stuff below...

tellab_process=`forever --no-colors list | grep tellab1_app.js`
len=${#tellab_process}

if [ $len -eq 0 ]; then
	echo No tellab1_app process running, nothing to stop
	exit
fi

#echo tellab_process = $tellab_process
#echo $tellab_process | od -c

# The output looks like this:
# data: [1] f0Px /home/jbmull/.nvm/versions/node/v6.17.1/bin/node redirect_http.js 8355 8365 /home/jbmull/.forever/f0Px.log 0:0:0:4.638
#
# All we need is that 1 in brackets...

idx=`echo "$tellab_process" | awk -F"[][]" '{print $2}'`

echo Will stop forever job $idx
forever stop $idx

exit

