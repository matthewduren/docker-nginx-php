FROM nginx:1.7.9
MAINTAINER Matt Duren <matthewduren@gmail.com>

# Install wget and install/updates certificates
RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    ca-certificates \
    wget \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

# Configure Nginx and apply fix for very long server names
RUN echo "daemon off;" >> /etc/nginx/nginx.conf \
 && sed -i 's/^http {/&\n    server_names_hash_bucket_size 128;/g' /etc/nginx/nginx.conf

 # Install Forego
RUN wget -P /usr/local/bin https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego \
 && chmod u+x /usr/local/bin/forego

<<<<<<< HEAD
ENV DOCKER_GEN_VERSION 0.5.0
=======
ENV DOCKER_GEN_VERSION 0.3.6
>>>>>>> 9cc3834f68785c531df30bb3361f8c0e6e7b2d7b

RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

COPY . /app/
WORKDIR /app/

ENV DOCKER_HOST unix:///tmp/docker.sock

VOLUME ["/etc/nginx/certs", "/var/apps", "/var/logs/web"]

<<<<<<< HEAD
CMD ["bash", "/app/run.sh"]
=======
CMD ["forego", "start", "-r"]
>>>>>>> 9cc3834f68785c531df30bb3361f8c0e6e7b2d7b
