#!/bin/bash
# Copyright (c) 2018-2019 VMware, Inc. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

docker login 192.168.1.101

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

echo "Building docker images..."

# Uncomment if you modify concord-builder and need to rebuild it
echo "Building concord-builder..."
docker build --rm -f "${DIR}/dockerfiles/builder/Dockerfile" -t vmwconcord/concord-builder:0.1 ${DIR}/..

echo "Pulling concord-builder..."
docker pull vmwconcord/concord-builder:0.2

docker tag vmwconcord/concord-builder:0.2 192.168.1.101/library/vmwconcord/concord-builder:0.2
docker push 192.168.1.101/library/vmwconcord/concord-builder:0.2

echo "Building concord-node..."
docker build --rm -f "${DIR}/dockerfiles/node/Dockerfile" -t concord-node:latest ${DIR}/..

docker tag concord-node 192.168.1.101/library/concord-node:latest
docker push 192.168.1.101/library/concord-node:latest

echo "Building concord-ethrpc..."
docker build --rm -f "${DIR}/dockerfiles/ethrpc/Dockerfile" -t concord-ethrpc:latest ${DIR}/..

docker tag concord-ethrpc 192.168.1.101/library/concord-ethrpc:latest
docker push 192.168.1.101/library/concord-ethrpc:latest


echo "Building concord-truffle..."
docker build --rm -f "${DIR}/dockerfiles/truffle/Dockerfile" -t concord-truffle:latest ${DIR}/..

docker tag concord-truffle 192.168.1.101/library/concord-truffle:latest
docker push 192.168.1.101/library/concord-truffle:latest


echo "Concord docker images built:"
docker image ls | grep concord- 
