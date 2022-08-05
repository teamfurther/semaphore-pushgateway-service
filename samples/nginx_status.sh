#!/bin/bash
var=$(service nginx status | grep 'active (running)')

[ -z "$var" ]; curl -X POST -H  "Content-Type: text/plain" --data "semaphore_nginx_status $?
" $SEMAPHORE_PUSHGATEWAY_ENDPOINT/metrics/job/semaphore/instance/$SEMAPHORE_INSTANCE