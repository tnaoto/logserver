VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.define :logserver do |log|
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
        "mongodb",
        "tdagent"
      ]
    end
  end

  config.vm.define :webserver do |web|
    web.vm.box = "CentOS65"
    
    web.omnibus.chef_version = :latest
    
    web.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end

    web.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["cookbooks","site-cookbooks"]
      chef.add_recipe "yum"
      chef.add_recipe "nginx"
      
      chef.run_list = [
        "yum",
        "nginx"
      ]
    end
  end

end
