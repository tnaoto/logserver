package "unzip" do
  action :install
end

package "rsync" do
  action :install
end

package "httpd" do
  action :install
end

ark "kibana" do
  url "http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip"
  path "/var/www/html"
  action :put
end

template "config.js" do
  path "/var/www/html/kibana/config.js"
  source "config.js.erb"
end

service "httpd" do
  action :start
end
