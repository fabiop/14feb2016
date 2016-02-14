#
# Cookbook Name:: my_golang
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'install-nginx' do
  # cwd Chef::Config[:file_cache_path]
  code <<-EOH
    apt-get install -y nginx
    update-rc.d nginx disable
    service nginx stop
    grep "daemon off;" /etc/nginx/nginx.conf \
       || echo "daemon off;" >> /etc/nginx/nginx.conf
  EOH
end

template '/etc/nginx/sites-available/default' do
  source 'default-site.erb'
  owner 'root'
  group node['root_group']
  mode '0644'
end
