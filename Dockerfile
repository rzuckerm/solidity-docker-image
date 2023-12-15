FROM node:20.10.0-slim

COPY SOLIDITY_* /tmp/
COPY *_solidity /usr/local/bin
RUN apt-get update && \
    apt-get install -y python3 && \
    npm install -g truffle@$(cat /tmp/SOLIDITY_TRUFFLE_VERSION) && \
    npm install -g ganache@$(cat /tmp/SOLIDITY_GANACHE_VERSION) && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
