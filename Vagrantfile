Vagrant.configure("2") do |config|
  config.vm.define "app" do |app|
    app.vm.provider "docker" do |d|
      d.build_dir = "."
      d.cmd = ["/sbin/my_init", "--enable-insecure-key"]
      d.has_ssh = true
    end 
  end
  config.ssh.username = "root"
  config.ssh.private_key_path = "insecure_key"
end
