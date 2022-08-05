#!/bin/bash
var=$(pidstat -d)
read=$(echo "$var" | awk 'NR>3 && $5>0 {print "semaphore_disk_io{process=\""$9"\", pid=\""$4"\", series=\"read\"}", $5z}')
write=$(echo "$var" | awk 'NR>3 && $6>0 {print "semaphore_disk_io{process=\""$9"\", pid=\""$4"\", series=\"write\"}", $6z}')

curl -X POST -H  "Content-Type: text/plain" --data "$read
$write
" $SEMAPHORE_PUSHGATEWAY_ENDPOINT/metrics/job/semaphore/instance/$SEMAPHORE_INSTANCE