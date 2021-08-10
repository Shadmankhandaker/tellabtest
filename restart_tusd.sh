#!/bin/bash

echo Restarting tusd server...
pwd
./stop_tusd.sh
./start_tusd.sh
 
echo ""

