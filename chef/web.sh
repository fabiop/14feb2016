#!/bin/bash

apt-get update
apt-get upgrade -y

chef-solo -c /chef/solo.rb -j /chef/roles/web.json

update-rc.d nginx disable

service nginx stop

sleep 5

/usr/sbin/nginx


