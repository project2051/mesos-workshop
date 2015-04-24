#!/usr/bin/env bash
CONF=/etc/nginx/conf.d/upstream.conf
PATH=/bin:/usr/bin

cd /etc/ssl/certs
#openssl dhparam -out dhparam.pem 4096

/usr/sbin/nginx

while true; do
  DIG=`dig @mesos-dns +short SRV _nginx-app._tcp.marathon.mesos | awk 'BEGIN { FS= " "}; { print $4":"$3 }' | sort`
  echo $DIG > /tmp/dig

  if ! diff /tmp/dig /tmp/dig_last; then
    sed -i.bak '2,$d' $CONF
    for i in $DIG; do
      echo -e "\tserver $i;\n" >> $CONF
    done
    echo "}" >> $CONF

    kill -HUP `pgrep -o nginx`

    echo $DIG > /tmp/dig_last
  fi
  sleep 1
done
