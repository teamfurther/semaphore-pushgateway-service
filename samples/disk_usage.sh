#!/bin/bash
var=$(df -h | grep ^/dev/ | awk '{sub(/%/,"",$5); print "semaphore_disk_usage{filesystem=\""$1"\", mounted=\""$6"\"}", $5/100}')

curl -X POST -H  "Content-Type: text/plain" --data "$var
" $SEMAPHORE_PUSHGATEWAY_ENDPOINT/metrics/job/semaphore/instance/$SEMAPHORE_INSTANCE