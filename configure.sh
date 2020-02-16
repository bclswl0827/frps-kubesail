#!/bin/sh
# Add Frps configuration
echo "\nvhost_http_port = 80" >> /usr/bin/frps/frps.ini
# Run Frps
/usr/bin/frps/frps -c /usr/bin/frps/frps.ini
