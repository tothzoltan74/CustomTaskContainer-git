#!/bin/bash

#while :; do 
#    echo "sleep 1"
#    sleep 1; 
#done

until [ -e /app/custom.sh ]; do
    echo "waiting for custom.sh..."
    sleep 1
done

cd /app
chmod 777 /app/custom.sh
./custom.sh