#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
yum_repository "nginx" do
  description "nginx Repository"
  url "http://nginx.org/packages/centos/6/x86_64/"
  sslverify false
  gpgcheck false
  action :create
end

package "nginx" do
  action :install
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action   [ :enable, :start ]
end