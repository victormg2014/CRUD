Vagrant.configure("2") do |config|
  config.vm.provider "docker" do |d|
    d.remains_running = false
    d.build_dir = "."
    d.has_ssh = true
  end
  config.ssh.username = "root"
  config.ssh.private_key_path = "id_rsa"
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "mysql"
    chef.cookbooks_path = "cookbooks"
  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.compatibility_mode = "2.0"
  end
end

