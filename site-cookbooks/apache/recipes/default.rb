#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "apache" do
  action :install
end

service "apache" do
  supports :status => true, :restart => true, :reload => true
  action   [ :enable, :start ]
end