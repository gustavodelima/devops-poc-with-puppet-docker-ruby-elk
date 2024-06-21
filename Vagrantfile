# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"

    config.vbguest.auto_update = true
  
    config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  
    config.vm.provision "shell", inline: <<-SHELL
      sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-7.noarch.rpm
      sudo yum install -y puppet-agent
      sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
    SHELL
  
    config.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet"
      puppet.manifest_file  = "setup.pp"
    end
  end
  