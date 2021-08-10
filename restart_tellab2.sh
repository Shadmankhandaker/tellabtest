#!/bin/bash

echo "restart_tellab2.sh:  checking to stop old processes..."
./stop_tellab2.sh

echo "restart_tellab2.sh:  starting processes..."
./start_tellab2.sh

