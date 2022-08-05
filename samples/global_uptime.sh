#!/bin/bash
URL=

var=$(curl -Is $URL | head -n 1 | grep '200')

[ -z "$var" ]; curl -X POST -H  "Content-Type: text/plain" --data "semaphore_global_uptime $?
" $SEMAPHORE_PUSHGATEWAY_ENDPOINT/metrics/job/semaphore/instance/$SEMAPHORE_INSTANCE