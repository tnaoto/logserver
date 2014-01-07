package "java-1.7.0-openjdk" do
  action :install
end

remote_file "/tmp/elasticsearch-0.90.9.noarch.rpm" do
  source "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.9.noarch.rpm"
end

package "elasticsearch" do
  action :install
  source "/tmp/elasticsearch-0.90.9.noarch.rpm"
  provider Chef::Provider::Package::Rpm
end

service "elasticsearch" do
  action :start
end
