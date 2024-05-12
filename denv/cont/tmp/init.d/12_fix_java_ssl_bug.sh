#!/bin/bash

# https://bugs.openjdk.org/browse/JDK-8213202
# https://stackoverflow.com/questions/52574050/javax-net-ssl-sslexception-no-psk-available-unable-to-resume

SCRIPT="/etc/profile.d/java_home.sh"

echo ""                                                                     >> $SCRIPT
echo "# FIX FOR JAVA 11 SSL / TLS 1.3 BUG #"                                >> $SCRIPT
echo "export JAVA_TOOL_OPTIONS=\"-Dhttps.protocols=TLSv1,TLSv1.1,TLSv1.2\"" >> $SCRIPT
