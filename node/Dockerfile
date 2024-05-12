FROM dmen/debian:10

# Install program files

COPY ./cont/tmp /tmp
COPY ./cont/entrypoint.sh /

RUN cd /tmp/node && ./install.sh -y

# What to run on container initiallization

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
