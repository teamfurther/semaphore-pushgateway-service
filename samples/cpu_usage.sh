#!/bin/bash
var=$(top -bn 1 | awk 'NR>6 && $9>0 {print "semaphore_cpu_usage{process=\""$12"\", pid=\""$1"\"}", $9z}')

curl -X POST -H  "Content-Type: text/plain" --data "$var
" $SEMAPHORE_PUSHGATEWAY_ENDPOINT/metrics/job/semaphore/instance/$SEMAPHORE_INSTANCE