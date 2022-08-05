#!/bin/bash
PROJECT_ROOT=/var/www/gofurther.digital

declare -A versions
versions[ubuntu]=$(lsb_release -r | awk '{print "semaphore_eol{series=\"ubuntu\", version=\""$2"\"}", 1}')
versions[nginx]=$(nginx -v 2>&1 | cut -d'/' -f2 | awk '{print "semaphore_eol{series=\"nginx\", version=\""$1"\"}", 1}')
versions[php]=$(php -r 'echo PHP_VERSION;' | awk '{print "semaphore_eol{series=\"php\", version=\""$0"\"}", 1}')
versions[laravel]=$(cd $PROJECT_ROOT && php artisan --version | awk '{print "semaphore_eol{series=\"laravel\", version=\""$3"\"}", 1}')
versions[composer]=$(composer -V | awk '{print "semaphore_eol{series=\"composer\", version=\""$3"\"}", 1}')
versions[node]=$(node -v | cut -c2- | awk '{print "semaphore_eol{series=\"node\", version=\""$0"\"}", 1}')
versions[vue]=$(cd $PROJECT_ROOT && npm list --depth=0 vue | grep vue | cut -d'@' -f2 | awk '{print "semaphore_eol{series=\"vue\", version=\""$0"\"}", 1}')
versions[mariadb]=$(mysql -V | awk '{print "semaphore_eol{series=\"mariadb\", version=\""substr($5, 0, length($5) - 9)"\"}", 1}')
versions[redis]=$(redis-server -v | awk '{print "semaphore_eol{series=\"redis\", version=\""substr($3z, 3)"\"}", 1}')

var=$( IFS=$'\n'; echo "${versions[*]}" )

curl -X POST -H  "Content-Type: text/plain" --data "$var
" $SEMAPHORE_PUSHGATEWAY_ENDPOINT/metrics/job/semaphore/instance/$SEMAPHORE_INSTANCE