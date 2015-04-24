#!/usr/bin/env bash

RAND=$RANDOM

sed -i.bak "2s/nginx[0-9]*/nginx$RAND/" nginx.json
echo Deploy nginx$RAND on marathon
echo
curl -L -H "Content-Type: application/json" -X POST -d@nginx.json http://marathon.touk.pl/v2/apps
echo

sleep 15

echo Display container info
echo
curl -L http://marathon.touk.pl/v2/apps/nginx$RAND
echo

sleep 60

echo Scale up!
echo
curl -L -H "Content-Type: application/json" -X PUT -d '{ "instances": 2}' http://marathon.touk.pl/v2/apps/nginx$RAND?force=true
echo

