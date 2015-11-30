# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.box = "trusty64"

  # node0 ====================================================================
  config.vm.define "infra0" do |infra0|

    infra0.vm.hostname = "infra0.local"
    infra0.vm.network "private_network", ip: "172.20.20.10"

    infra0.vm.provision :puppet do |puppet|
      puppet.hiera_config_path = "hiera/hiera.yaml"
      puppet.manifests_path = "puppet"
      puppet.module_path    = ["puppet/modules", "puppet/local-modules"]
      puppet.manifest_file  = "node.pp"
      puppet.options = [
        # '--verbose',
        # '--debug',
      ]
    end
  end
  # end ========================================================================

  # demo =======================================================================
  config.vm.define "app0" do |app0|

    app0.vm.hostname = "app0.local"
    app0.vm.network "private_network", ip: "172.20.20.11"

    app0.vm.provision :puppet do |puppet|
      puppet.hiera_config_path = "hiera/hiera.yaml"
      puppet.manifests_path = "puppet"
      puppet.module_path    = ["puppet/modules", "puppet/local-modules"]
      puppet.manifest_file  = "node.pp"
      puppet.options = [
        # '--verbose',
        # '--debug',
      ]
    end
  end
  # end ========================================================================

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

end


