#!/bin/bash

apt-get update
apt-get upgrade -y

chef-solo -c /chef/solo.rb -j /chef/roles/web.json

# Disable nginx boot and stop the daemon as we want 
# to run it in foreground mode inside the container
update-rc.d nginx disable
service nginx stop

sleep 5

echo "@@@@@@@@@@ READY, LAUNCHING NGINX @@@@@@@@@@@"

/usr/sbin/nginx


