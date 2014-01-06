#
# Cookbook Name:: tdagent
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

yum_repository "treasuredata" do
  description "TreasureData"
  url "http://packages.treasure-data.com/redhat/$basearch"
  sslverify false
  gpgcheck false
  action :create
end

package "td-agent" do
  action :install
end

service "td-agent" do
  supports :status => true, :restart => true, :reload => true
  action   [ :enable, :start ]
end

service "iptables" do
  action   [ :stop ]
end
