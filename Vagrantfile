# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.provider "virtualbox" do |vb|
		vb.memory = 1024
	end
	config.vm.define "master" do |master|
		master.vm.box = "debian/jessie64"
		master.vm.host_name = "saltmaster.local"
		master.vm.network "private_network", ip: "192.168.85.10"
		master.vm.synced_folder "salt/salt/", "/srv/salt"
		master.vm.synced_folder "salt/pillar/", "/srv/pillar"

		master.vm.provision :salt do |salt|
			salt.master_config = "salt/etc/master"
			salt.master_key = "salt/keys/master.pem"
			salt.master_pub = "salt/keys/master.pub"
			salt.minion_key = "salt/keys/master.pem"
			salt.minion_pub = "salt/keys/master.pub"
			salt.seed_master = {
				"saltminion01" => "salt/keys/minion01.pub",
			}
			salt.install_type = "stable"
			salt.install_master = true
			salt.no_minion = true
			salt.verbose = true
			salt.colorize = true
			salt.bootstrap_options = "-P -c /tmp"
		end
	end

	config.vm.define "minion01" do |minion_config|
		minion_config.vm.box = "debian/jessie64"
		minion_config.vm.host_name = 'saltminion01.local'
		minion_config.vm.network "private_network", ip: "192.168.85.11"

		minion_config.vm.provision :salt do |salt|
			salt.minion_config = "salt/etc/minion01"
			salt.minion_key = "salt/keys/minion01.pem"
			salt.minion_pub = "salt/keys/minion01.pub"
			salt.install_type = "stable"
			salt.verbose = true
			salt.colorize = true
			salt.bootstrap_options = "-P -c /tmp"
		end
	end

end
