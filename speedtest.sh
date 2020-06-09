#!/usr/bin/env sh

timestamp=$(date +%s%N)
hostname=$(hostname)

echo "Current timestamp: $timestamp"

output=$(speedtest-cli --simple --bytes --server $SERVER)

#https://c.speedtest.net/speedtest-servers-static.php

echo "Output: $output"

line=$(echo -n "$output" | awk '/Ping/ {print "ping=" $2} /Download/ {print "download=" $2 * 1000 * 1000} /Upload/ {print "upload=" $2 * 1000 * 1000}' | tr '\n' ',' | head -c -1)
curl -XPOST "http://$INFLUXDB_HOST:$INFLUXDB_PORT/write?db=$INFLUXDB_DATABASE" -d "speedtest,host=$hostname$EXTRA_TAGS $line $timestamp"

echo "New speedtest sent"
