#! /bin/bash

CERT_DIR="certs"

# assumes this is done
# cockroach cert create-ca --certs-dir=$CERT_DIR --ca-key=my-safe-directory/ca.key
# cockroach cert create-node localhost $(hostname) --certs-dir=$CERT_DIR --ca-key=my-safe-directory/ca.key

start()
{
    local HOST=localhost
    local HOST1="$HOST:26257"
    local HOST1_HTTP="$HOST:10081"
    local HOST2="$HOST:26258"
    local HOST2_HTTP="$HOST:10082"
    local HOST3="$HOST:26259"
    local HOST3_HTTP="$HOST:10083"

    cockroach start --certs-dir=$CERT_DIR --store=node1 --listen-addr=$HOST1 --http-addr=$HOST1_HTTP --join=$HOST1,$HOST2,$HOST3 --background
    cockroach start --certs-dir=$CERT_DIR --store=node2 --listen-addr=$HOST2 --http-addr=$HOST2_HTTP --join=$HOST1,$HOST2,$HOST3 --background
    cockroach start --certs-dir=$CERT_DIR --store=node3 --listen-addr=$HOST3 --http-addr=$HOST3_HTTP --join=$HOST1,$HOST2,$HOST3 --background

#    cockroach init --certs-dir=$CERT_DIR --host=$HOST1

    # grep 'node starting' node1/logs/cockroach.log -A 11
    # grep 'node starting' node2/logs/cockroach.log -A 11
    # grep 'node starting' node3/logs/cockroach.log -A 11
}

start