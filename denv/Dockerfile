FROM debian:buster

# Install OS packages

RUN apt update \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt install -y vim nano zip unzip xz-utils net-tools \
 && apt install -y ca-certificates curl \
 && apt install -y build-essential pkg-config cmake \
 && apt install -y autoconf automake libtool \
 && apt install -y git

# Install program files

COPY ./cont/tmp /tmp
COPY ./cont/entrypoint.sh /

RUN ln -s /tmp/install.in /usr/local/bin/

RUN cd /tmp/docker && ./install-docker-client.sh -y

RUN cd /tmp/java && ./install-java.sh -y

RUN cd /tmp/java && ./install-ant.sh -y

RUN cd /tmp/java && ./install-maven.sh -y

RUN cd /tmp/node && ./install-node.sh -y

RUN cd /tmp/wasm && ./install-wasi-sdk.sh -y

RUN cd /tmp/wasm && ./install-wasmtime.sh -y

# What to run on container initiallization

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
