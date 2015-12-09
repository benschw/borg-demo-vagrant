# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.box = "trusty64"

  #=============================================================================
  # DC0
  #
  # infra00
  config.vm.define "infra00" do |infra00|

    infra00.vm.hostname = "infra00.local"
    infra00.vm.network "private_network", ip: "172.20.10.10"

    infra00.vm.provision :puppet do |puppet|
      puppet.hiera_config_path = "hiera/hiera.yaml"
      puppet.manifests_path = "puppet"
      puppet.module_path    = ["puppet/modules", "puppet/local-modules"]
      puppet.manifest_file  = "node.pp"
    end
  end

  # app00
  config.vm.define "app00" do |app00|

    app00.vm.hostname = "app00.local"
    app00.vm.network "private_network", ip: "172.20.10.11"

    app00.vm.provision :puppet do |puppet|
      puppet.hiera_config_path = "hiera/hiera.yaml"
      puppet.manifests_path = "puppet"
      puppet.module_path    = ["puppet/modules", "puppet/local-modules"]
      puppet.manifest_file  = "node.pp"
    end
  end

  # app01
  config.vm.define "app01" do |app01|

    app01.vm.hostname = "app01.local"
    app01.vm.network "private_network", ip: "172.20.10.12"

    app01.vm.provision :puppet do |puppet|
      puppet.hiera_config_path = "hiera/hiera.yaml"
      puppet.manifests_path = "puppet"
      puppet.module_path    = ["puppet/modules", "puppet/local-modules"]
      puppet.manifest_file  = "node.pp"
    end
  end

  #=============================================================================
  # DC1
  #
  # infra10
  config.vm.define "infra10" do |infra10|

    infra10.vm.hostname = "infra10.local"
    infra10.vm.network "private_network", ip: "172.20.20.10"

    infra10.vm.provision :puppet do |puppet|
      puppet.hiera_config_path = "hiera/hiera.yaml"
      puppet.manifests_path = "puppet"
      puppet.module_path    = ["puppet/modules", "puppet/local-modules"]
      puppet.manifest_file  = "node.pp"
    end
  end

  # app10
  config.vm.define "app10" do |app10|

    app10.vm.hostname = "app10.local"
    app10.vm.network "private_network", ip: "172.20.20.11"

    app10.vm.provision :puppet do |puppet|
      puppet.hiera_config_path = "hiera/hiera.yaml"
      puppet.manifests_path = "puppet"
      puppet.module_path    = ["puppet/modules", "puppet/local-modules"]
      puppet.manifest_file  = "node.pp"
    end
  end

  # app11
  config.vm.define "app11" do |app11|

    app11.vm.hostname = "app11.local"
    app11.vm.network "private_network", ip: "172.20.20.12"

    app11.vm.provision :puppet do |puppet|
      puppet.hiera_config_path = "hiera/hiera.yaml"
      puppet.manifests_path = "puppet"
      puppet.module_path    = ["puppet/modules", "puppet/local-modules"]
      puppet.manifest_file  = "node.pp"
    end
  end

  #=============================================================================
  # common
  #
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

end


