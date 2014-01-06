#
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

yum_repository "mongodb" do
  description "MongoDB Repository"
  url "http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/"
  sslverify false
  gpgcheck false
  action :create
end

package "mongo-10gen" do
  action :install
end

package "mongo-10gen-server" do
  action :install
end

service "mongod" do
  supports :status => true, :restart => true, :reload => true
  action   [ :enable, :start ]
end

service "iptables" do
  action :stop
end
