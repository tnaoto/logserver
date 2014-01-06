template "td-agent.conf" do
  path "/etc/td-agent/td-agent.conf"
  source "td-agent.conf.receive.erb"
end

service "td-agent" do
  action   [ :stop, :start ]
end