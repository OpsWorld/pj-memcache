#!/bin/bash 

PID=$(cat /tmp/memcached.pid) 
kill -9 $PID

if [ $? == 0 ];then
  rm -rf /tmp/memcached.pid
  if [ -f /tmp/memcached.pid ];then
    echo "Please deleted the /tmp/memcached.pid "
  else
    echo "The memcached has stopped!!!!!!"
  fi
else
  echo "The memcached stopped is failed !!!"
fi

exit 0
