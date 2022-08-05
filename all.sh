#!/bin/bash

export SEMAPHORE_PUSHGATEWAY_ENDPOINT=http://localhost:9091
export SEMAPHORE_INSTANCE=

while sleep 1
do
    cd /etc/prometheus/scripts &&
    bash ./cpu_usage.sh &&
    bash ./global_uptime.sh &&
    bash ./disk_usage.sh &&
    bash ./disk_io.sh &&
    bash ./memory_usage.sh &&
    bash ./mysql_status.sh &&
    bash ./nginx_status.sh &&
    bash ./ssl_status.sh &&
    bash ./eol.sh
done

exit 0
