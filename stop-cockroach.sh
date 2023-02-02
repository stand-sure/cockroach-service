#! /bin/bash

stop() {
    echo "Stopping CockroachDB"
    
    local processIds;
    processIds=$(pgrep cockroach)

    for processId in $processIds; do
        echo "Stopping process $processId"
        kill -TERM "$processId"
    done
}

stop