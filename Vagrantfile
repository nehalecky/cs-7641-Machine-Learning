# -*- mode: ruby -*-
# vi: set ft=ruby :

ipythonPort = 8009  # Ipython port to forward (also set in IPython notebook config)

Vagrant.configure(2) do |config|
  config.ssh.insert_key = true

  config.vm.define "machinelearningvm" do |master|
    master.vm.box = "ubuntu/trusty64"
    master.vm.boot_timeout = 900

    # Set IPython port (set in notebook config) forwarding
    master.vm.network :forwarded_port, host: ipythonPort, guest: ipythonPort, auto_correct: true

    # Set Spark UI (Driver) port forwarding
    #master.vm.network :forwarded_port, host: 4040, guest: 4040, auto_correct: true
    master.vm.hostname = "machinelearningvm"
    #master.vm.usable_port_range = 4040..4090

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.

    master.vm.synced_folder "./assignments", "/home/vagrant/assignments"
    master.vm.synced_folder "./bin", "/home/vagrant/bin"


    # Enable provisioning with a shell script. Additional provisioners such as
    # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
    # documentation for more information about their specific syntax and use.

    master.vm.provision :shell, path: "./bin/bootstrap.sh", privileged: false
    #master.vm.provision :shell, :inline => "./bin/launch-jupyter.sh", run: "always"




    master.vm.provider :virtualbox do |vb|

      vb.name = master.vm.hostname.to_s

      # Display the VirtualBox GUI when booting the machine
      # vb.gui = true
      #
      # Customize the amount of memory on the VM:
      vb.memory = "2048"
    end

  end
end
