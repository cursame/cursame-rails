VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "pixative/debian-wheezy-64"
  config.vm.box_download_checksum_type = "sha1"
  config.vm.box_download_checksum = "557f80a108fc480e04808185c2316024354693df"
  config.vm.box_check_update = true

  config.vm.hostname = "cursame-rails"

  config.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true

  config.vm.synced_folder ".", "/home/vagrant/source"
  config.vm.provision "shell", path: "script/provision.sh"
  config.vm.provider "virtualbox" do |vb|
    vb.gui    = false
    vb.name   = "cursame-rails"
    vb.memory = 1024
    vb.cpus   = 1
  end

  config.ssh.username      = "vagrant"
  config.ssh.forward_agent = false
  config.ssh.forward_x11   = false
  config.ssh.insert_key    = false
end
