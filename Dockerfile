FROM debian:latest

LABEL Version="latest" \
      Maintainer="Mark Dastmalchi-Round (mark@markround.com)" \
      Description="Docker container with tnfsd"

RUN apt -y update && \
  apt -y install build-essential git && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /build && \
  cd /build && \
  git clone https://github.com/spectrumero/spectranet.git && \
  cd spectranet/tnfs/tnfsd && \
  make OS=LINUX USAGELOG=yes && \
  cp bin/tnfsd /usr/local/sbin
  
# Set user and group
ARG user=tnfsd
ARG group=tnfsd
ARG uid=1000
ARG gid=1000
RUN groupadd -g ${gid} ${group}
RUN useradd -u ${uid} -g ${group} -s /bin/sh -m ${user}

# Switch to user
USER ${uid}:${gid}

VOLUME /data
EXPOSE 16384/udp

CMD ["/usr/local/sbin/tnfsd","/data"]
