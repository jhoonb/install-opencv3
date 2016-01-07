# -*- mode: ruby -*-
# vi: set ft=ruby :
# - github.com/jhoonb
# -------------------------------------------------------------------------
Vagrant.configure(2) do |config|
  config.vm.box = "vivid-server-cloudimg-amd64-vagrant-disk1.box"
  # shared folders
  config.vm.synced_folder "/your/folder/", "/box-vm/folder"

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
  end
end
