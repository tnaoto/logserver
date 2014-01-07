VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.define :logserver do |log|
    log.vm.network :private_network, ip:"192.168.1.12"
    log.vm.box = "CentOS65"
    
    log.omnibus.chef_version = :latest
    
    log.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    log.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["cookbooks","site-cookbooks"]
      chef.add_recipe "yum"
      chef.add_recipe "mongodb"
      chef.add_recipe "tdagent"
      
      chef.run_list = [
        "yum",
        "elasticsearch",
        "kibana",
        "tdagent",
        "tdagent::install-plugin-elasticsearch",
        "tdagent::receive" 
      ]
      chef.json = {
        java: {install_flavor: "openjdk"},
        java: {jdk_version: "7"},
        elasticsearch: {version: "0.90.9"}
      }
      
    end
  end

  config.vm.define :webserver do |web|
    web.vm.network :private_network, ip:"192.168.1.11"
    web.vm.box = "CentOS65"
    
    web.omnibus.chef_version = :latest
    
    web.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end

    web.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["cookbooks","site-cookbooks"]
      chef.add_recipe "yum"
      chef.add_recipe "apache"
      chef.add_recipe "tdagent"
            
      chef.run_list = [
        "yum",
        "apache",
        "tdagent",
        "tdagent::send"
      ]
    end
  end

end
