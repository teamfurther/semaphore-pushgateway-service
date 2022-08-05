#!/bin/bash
var=$(top -bn 1 | awk 'NR>6 && $10>0 {print "semaphore_memory_usage{process=\""$12"\", pid=\""$1"\"}", $10z}')

curl -X POST -H  "Content-Type: text/plain" --data "$var
" $SEMAPHORE_PUSHGATEWAY_ENDPOINT/metrics/job/semaphore/instance/$SEMAPHORE_INSTANCE