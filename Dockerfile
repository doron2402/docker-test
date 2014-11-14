FROM dockerfile/ubuntu

MAINTAINER Doron Segal <doron2402@gmail>

# update and upgrade
RUN   \
  apt-get update
  apt-get upgrade 
# Install Redis
RUN   \
  apt-get install -y redis-server
  cp /etc/redis/redis.conf /etc/redis/redis.conf.default
  apt-get install python

# Install Node
RUN   \
  cd /opt && \
    wget http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz && \
      tar -xzf node-v0.10.28-linux-x64.tar.gz && \
        mv node-v0.10.28-linux-x64 node && \
          cd /usr/local/bin && \
            ln -s /opt/node/bin/* . && \
              rm -f /opt/node-v0.10.28-linux-x64.tar.gz

# Set the working directory
WORKDIR   /src

EXPOSE 3000

CMD ["/bin/bash"]
