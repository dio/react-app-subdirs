#!/bin/sh

# Copyright (c) Tetrate, Inc 2019 All Rights Reserved.

set -e

if [[ -z "${API_HOST}" ]]; then
    echo "running without proxying..."
    cp /etc/nginx/conf.d/server.conf.template /etc/nginx/conf.d/default.conf
else
    # We don't want to replace undefined env vars.
    envsubst "$(env | sed -e 's/=.*//' -e 's/^/\$/g')" \
        < /etc/nginx/conf.d/server-with-proxy-pass.conf.template > /etc/nginx/conf.d/default.conf
fi

mkdir -p /usr/share/nginx/html
mkdir -p /run/nginx

chown -Rf nginx.nginx /usr/share/nginx/html

/usr/sbin/nginx -g "daemon off;"
