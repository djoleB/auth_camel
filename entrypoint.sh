#!/bin/sh

start="/opt/karaf/bin/start"
log="/opt/karaf/data/log/karaf.log"

touch $log

$start

echo "Waiting for system to start"

sleep 2

tail -f $log