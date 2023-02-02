#! /bin/bash

cd /Users/cjanderson/repos/cockroach-service

PATH="$PATH:/usr/local/bin"

./start-cockroach.sh >/var/log/start-cockroach.log >/dev/null 2>&1