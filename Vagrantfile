# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
   config.ssh.forward_agent = true
   config.vm.box = "ubuntu/jammy64" # from their official repository
   config.vm.disk :disk, size: "150GB", primary: true
   config.vm.provider "virtualbox" do |vb|
     # show console
     vb.gui = true
     # RAM
     vb.memory = 4096
     # CPU
     vb.cpus = 2

     vb.name = ENV['UBUNTUI3_VM_NAME'] + "-" + ENV['UBUNTUI3_VM_VERSION']

     vb.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
     vb.customize ['modifyvm', :id, '--vram', '128']
     vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
   end

   if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.no_install  = false
   end
 
   config.vm.provision "shell", path: "./scripts/install-tools.sh", name: "install tools", privileged: false, reboot: true

end