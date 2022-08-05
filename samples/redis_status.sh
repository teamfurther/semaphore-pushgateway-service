#!/bin/bash
var=$(service redis status | grep 'active (running)')

[ -z "$var" ]; curl -X POST -H  "Content-Type: text/plain" --data "semaphore_redis_status $?
" $SEMAPHORE_PUSHGATEWAY_ENDPOINT/metrics/job/semaphore/instance/$SEMAPHORE_INSTANCE