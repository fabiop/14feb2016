#
# Cookbook Name:: my_golang
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'install-golang' do
  # cwd Chef::Config[:file_cache_path]
  code <<-EOH
    cd /tmp/
    GODIR="/usr/local/"
    [ -f /tmp/go1.5.3.linux-amd64.tar.gz ] || curl -O https://storage.googleapis.com/golang/go1.5.3.linux-amd64.tar.gz
    [ -d ${GODIR}/go ] && rm -rf ${GODIR}/go
    mkdir ${GODIR}/go
    tar -C $GODIR -xzf go1.5.3.linux-amd64.tar.gz
    #grep -vq "/usr/local/go/bin" /root/.profile && \
    #    echo "export PATH=$PATH:/usr/local/go/bin" >> /root/.profile
    #source ~/.profile
  EOH
end
