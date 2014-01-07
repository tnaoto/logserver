bash "fluent-plugin-mongo" do
  code <<-"EOH"
     /usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-elasticsearch
  EOH
  action :run
end

service "td-agent" do
	action :restart
end