FROM debian:bookworm

# Install OS packages

RUN apt update \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt install -y vim nano \
 && apt install -y curl zip unzip

RUN apt install -y lsb-base lsb-release \
 && ln -s /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 /usr/lib64/ld-lsb-x86-64.so.3

RUN apt install -y x11-apps

# Install program files

COPY ./cont/tmp /tmp
COPY ./cont/entrypoint.sh /

RUN cd /tmp/portable && ./install-kjpbs.sh -y

# What to run on container initiallization

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
