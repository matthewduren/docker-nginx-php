#!/bin/bash

if [[ "$ENVIRONMENT" == "local" ]]; then
    sed -i "s/sendfile        on/sendfile        off/g" /etc/nginx/nginx.conf
fi

# Start foreman
forego start -r
