FROM dmen/debian:10

# Install OS packages

RUN apt update \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt install -y libaio1 libncurses5

# Install program files

COPY ./cont/tmp /tmp
COPY ./cont/entrypoint.sh /

RUN cd /tmp/mysql && ./install.sh -y

# What ports to expose

EXPOSE 3306

# What to run on container initiallization

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
