# Copyright 2019 VMware, all rights reserved.
# This software is released under MIT license.
# The full license information can be found in LICENSE in the root directory of this project.


FROM node:10.17.0 as node
LABEL Description="Supply Chain dApp"

RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list
RUN apt-get update && apt-get -y install vim nano mc && rm -rf /var/lib/apt/lists/* 


WORKDIR /app

COPY ./ /app/

RUN npm install
RUN npm install -g --unsafe-perm=true --allow-root  truffle@5.1.22
RUN npm install -g truffle-flattener@1.3.0
RUN node patch.js

ARG env=prod

EXPOSE 4200

