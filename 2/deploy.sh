#!/usr/bin/env bash

echo Deploy nginx-app and nginx-proxy on mesos
echo
curl -L -H "Content-Type: application/json" -X POST -d@nginx-app.json http://marathon.touk.pl/v2/apps
curl -L -H "Content-Type: application/json" -X POST -d@nginx-proxy.json http://marathon.touk.pl/v2/apps
echo
echo
