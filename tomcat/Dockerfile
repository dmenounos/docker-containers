FROM dmen/java:08

# Install program files

COPY ./cont/tmp /tmp
COPY ./cont/entrypoint.sh /

RUN cd /tmp/tomcat && ./install.sh -y

# What ports to expose

EXPOSE 8080
EXPOSE 8443
