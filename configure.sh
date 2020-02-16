#!/bin/sh
# Add Frps configuration
echo "\ntoken = $FRP_TOKEN\nvhost_http_port = 80\ntcp_mux = $TCP_MUX" >> /usr/bin/frps/frps.ini
# Run Frps
/usr/bin/frps/frps -c /usr/bin/frps/frps.ini
