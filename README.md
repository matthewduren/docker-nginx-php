# docker-nginx-php
This container automatically builds nginx.conf based on the included nginx.tmpl for any folder in /var/apps.

The nginx.conf is intended to be used behind a load balancer such as an Amazon ELB.
It listens on 80 and rewrites to https://.  It then also listens on 443, but without SSL enabled.

Note that this container expects you to offload SSL to a load balancer or external proxy server.
