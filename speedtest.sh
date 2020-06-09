#!/usr/bin/env sh

timestamp=$(date +%s%N)
hostname=$(hostname)

echo "Current timestamp: $timestamp"

output=$(speedtest-cli --simple)

#https://c.speedtest.net/speedtest-servers-static.php

echo "Output: $output"

line=$(echo -n "$output" | awk '/Ping/ {print "ping=" $2} /Download/ {print "download=" $2} /Upload/ {print "upload=" $2}' | tr '\n' ',' | head -c -1)
curl -XPOST "http://$INFLUXDB_HOST:$INFLUXDB_PORT/write?db=$INFLUXDB_DATABASE" -d "speedtest,host=$hostname $line $timestamp"

echo "New speedtest sent"
