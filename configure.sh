#!/bin/sh
# Add Frps configuration
echo "\ntoken = $TOKEN\nvhost_http_port = 80\ntcp_mux = false" >> /usr/bin/frps/frps.ini
# Run Frps
/usr/bin/frps/frps -c /usr/bin/frps/frps.ini
