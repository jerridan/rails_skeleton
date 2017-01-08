Vagrant.configure(2) do |config|
  config.vm.hostname = "elby-db"
  config.vm.box = "ubuntu/xenial64"
  config.vm.provision :shell, path: "vagrant_setup.sh", keep_color: true

  config.vm.network :private_network, ip: "192.168.3.4"
  config.vm.network :forwarded_port, guest: 15432, host: 15432

  config.vm.provider "virtualbox" do |v|
    v.name = "elby-db"
    v.memory = 512
  end
end
