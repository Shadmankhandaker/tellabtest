#!/bin/bash
#

# first stop the proxy
./stop_tusd_proxy.sh

echo ' '
echo 'Stopping tusd server'
echo ' '

# tusd is not a node program, it is just a background process.
# We use ps to find the pid, so we can kill it...

psoutput=(`ps aux | grep uploadServer | grep tusd`)

nwords=${#psoutput[@]}
if [ $nwords == 0 ]; then
	echo No tusd process found.
	exit
fi

n_expected_words=12
if [ $nwords != $n_expected_words ]; then
	echo Expected $n_expected_words words from ps command, got $nwords
	exit
fi

cmd=${psoutput[10]}
expected_cmd=uploadServer/tusd/tusd
if [ $cmd != $expected_cmd ]; then
	echo Found command $cmd, expected $expected_cmd
	exit
fi

pid=${psoutput[1]}
echo Will kill process $pid
kill -9 $pid

echo ""


exit

echo ${psoutput[0]}	# jbmull
echo ${psoutput[1]}	# pid?
echo ${psoutput[2]}	#
echo ${psoutput[3]}	#
echo ${psoutput[4]}	#
echo ${psoutput[5]}	#
echo ${psoutput[6]}	#
echo ${psoutput[7]}	#
echo ${psoutput[8]}	#
echo ${psoutput[9]}	#
echo ${psoutput[10]}	#
echo ${psoutput[11]}	#

