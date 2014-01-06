#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
  action :install
end

directory "/var/log/httpd" do
 mode "0755"
end

service "httpd" do
  supports :status => true, :restart => true, :reload => true
  action   [ :enable, :start ]
end

