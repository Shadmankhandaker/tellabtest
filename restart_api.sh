#!/bin/bash

echo "restart_api.sh calling stop_api.sh"
./stop_api.sh
echo "restart_api.sh calling start_api.sh"
./start_api.sh

