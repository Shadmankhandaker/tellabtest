#!/bin/bash

echo Initial rule state:
iptables -L -t nat -v --line-numbers

echo Deleting the first two PREROUTING rules
iptables -t nat -D PREROUTING 1
iptables -t nat -D PREROUTING 1

echo Deleting the first two OUTPUT rules
iptables -t nat -D OUTPUT 1
iptables -t nat -D OUTPUT 1

echo Final rule state:
iptables -L -t nat -v --line-numbers

exit 0

