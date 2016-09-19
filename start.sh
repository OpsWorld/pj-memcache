#!/bin/bash

/usr/local/memcached/bin/memcached -d -m 3076 -p 11211 -u root -t 10 -P /tmp/memcached.pid

if [ $? == 0 ];then

    echo "memecached has succeeded!!!"
fi

exit 0
