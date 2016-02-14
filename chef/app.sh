#!/bin/bash

apt-get update
apt-get upgrade -y

# DEBUG # chef-solo -c solo.rb -j roles/app.json

chef-solo -c /chef/solo.rb -j /chef/roles/app.json

/usr/local/go/bin/go run /chef/sample.go

