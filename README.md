# docker-nginx-php
This container automatically builds nginx.conf based on the included nginx.tmpl for any container that has either the VIRTUAL_HOST environment variable (for phpfpm) or PROXY_HOST environment variable (for basic proxy_pass).  Note that the php or proxy container(s) must have at least some port exposed.

The nginx.conf is intended to be used behind a load balancer such as an Amazon ELB.
It listens on 80 and rewrites to https://.  It then also listens on 443, but without SSL enabled.

Note that this container expects you to offload SSL to a load balancer or external proxy server.
