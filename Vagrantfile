VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64" 
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :private_network, ip:"192.168.1.11"
  config.omnibus.chef_version = :latest

  config.vm.provider :virtualbox do |vb|
     vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks","site-cookbooks"]
    chef.add_recipe "apt"
    chef.add_recipe "td-agent"
    chef.add_recipe "nginx"
    chef.add_recipe "elasticsearch"
    chef.add_recipe "kibana"
    chef.add_recipe "elasticsearch-fluentd"

    chef.run_list = [
      "java",
      "elasticsearch",
      "td-agent",
      "nginx",
      "kibana"
    ]
  
    chef.json = { 
      "java" => { "install_flavor" => "openjdk", "jdk_version" => "7" },
      "td_agent" => { "plugins" => [ "elasticsearch" ]}
    }
   end
end