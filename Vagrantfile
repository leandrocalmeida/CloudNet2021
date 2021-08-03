Vagrant.configure("2") do |config|


    config.vm.define "bmv2_1" do |bmv2_1|
        bmv2_1.vm.box = "leandrocdealmeida/bmv2-p4"
        bmv2_1.vm.hostname = "bmv2-1"
        bmv2_1.vm.network "private_network", ip: "192.168.56.201",
            name: "vboxnet0"
        bmv2_1.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "ds-S1"
        bmv2_1.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "S1-S2"
        bmv2_1.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "S1-lg3"
        bmv2_1.vm.provider "virtualbox" do |v|
            v.memory = 1024
            v.cpus = 2
            v.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
            v.customize ["modifyvm", :id, "--nicpromisc4", "allow-all"]
            v.customize ["modifyvm", :id, "--nicpromisc5", "allow-all"]
            v.customize ["modifyvm", :id, "--nicpromisc6", "allow-all"]
        end
        bmv2_1.vm.provision "ansible" do |ansible| 
            ansible.playbook = "switch-setup/bmv2_1/bmv2_1-playbook.yml"
        end
    end

    config.vm.define "bmv2_2" do |bmv2_2|
        bmv2_2.vm.box = "leandrocdealmeida/bmv2-p4"
        bmv2_2.vm.hostname = "bmv2-2"
        bmv2_2.vm.network "private_network", ip: "192.168.56.202",
            name: "vboxnet0"
        bmv2_2.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "S1-S2"
        bmv2_2.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "S2-S3"
        bmv2_2.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "S2-lg2"
        bmv2_2.vm.provider "virtualbox" do |v|
            v.memory = 1024
            v.cpus = 2
            v.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
            v.customize ["modifyvm", :id, "--nicpromisc4", "allow-all"]
            v.customize ["modifyvm", :id, "--nicpromisc5", "allow-all"]
        end
        bmv2_2.vm.provision "ansible" do |ansible| 
            ansible.playbook = "switch-setup/bmv2_2/bmv2_2-playbook.yml"
        end
    end

    config.vm.define "bmv2_3" do |bmv2_3|
        bmv2_3.vm.box = "leandrocdealmeida/bmv2-p4"
        bmv2_3.vm.hostname = "bmv2-3"
        bmv2_3.vm.network "private_network", ip: "192.168.56.203",
            name: "vboxnet0"
        bmv2_3.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "S2-S3"
        bmv2_3.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "S3-cvlc"
        bmv2_3.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "S3-sk"
        bmv2_3.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "S3-lg1"
        bmv2_3.vm.network "private_network", auto_config: false,
            virtualbox__intnet: "S3-lg4"
        bmv2_3.vm.provider "virtualbox" do |v|
            v.memory = 1024
            v.cpus = 2
            v.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
            v.customize ["modifyvm", :id, "--nicpromisc4", "allow-all"]
            v.customize ["modifyvm", :id, "--nicpromisc5", "allow-all"]
            v.customize ["modifyvm", :id, "--nicpromisc6", "allow-all"]
            v.customize ["modifyvm", :id, "--nicpromisc7", "allow-all"]
        end
        bmv2_3.vm.provision "ansible" do |ansible| 
            ansible.playbook = "switch-setup/bmv2_3/bmv2_3-playbook.yml"
        end
    end

    config.vm.define "dashServer" do |ds|
        ds.vm.box = "ubuntu/xenial64"
        ds.vm.hostname = "dashServer"
        ds.vm.network "private_network", ip: "192.168.50.50", mac: "080027000000",
            virtualbox__intnet: "ds-S1"
        ds.vm.provider "virtualbox" do |v|
            v.memory = 4096
            v.cpus = 6
        end
        ds.vm.provision "ansible" do |ansible| 
            ansible.playbook = "host-setup/dashServer/dashServer-playbook.yml"
        end
    end

    config.vm.define "clientVlc" do |cvlc|
        #RDP port 8080
        cvlc.vm.box = "leandrocdealmeida/ubuntu-vlc"
        cvlc.vm.hostname = "clientVlc"
        cvlc.vm.network "private_network", ip: "192.168.50.51", mac: "080027000001",
            virtualbox__intnet: "S3-cvlc"
        cvlc.vm.provider "virtualbox" do |v|
            v.memory = 8192
            v.cpus = 8
            v.customize ["modifyvm", :id, "--accelerate3d", "on"]
            v.customize ["modifyvm", :id, "--vrde", "on"]
            v.customize ["modifyvm", :id, "--vrdeport", "8080"]
        end
        cvlc.vm.provision "ansible" do |ansible| 
            ansible.playbook = "host-setup/clientVlc/clientVlc-playbook.yml"
        end
    end

    config.vm.define "sinkServer" do |sk|
        sk.vm.box = "ubuntu/focal64"
        sk.vm.hostname = "sinkServer"
        sk.vm.network "private_network", ip: "192.168.50.52", mac: "080027000002",
            virtualbox__intnet: "S3-sk"
        sk.vm.provider "virtualbox" do |v|
            v.memory = 8192
            v.cpus = 3
        end
        sk.vm.provision "ansible" do |ansible| 
            ansible.playbook = "host-setup/sinkServer/sinkServer-playbook.yml"
        end
    end

    config.vm.define "loadGen1" do |lg|
        #RDP port 8022
        lg.vm.box = "leandrocdealmeida/ubuntu-vlc"
        lg.vm.hostname = "loadGen1"
        lg.vm.network "private_network", ip: "192.168.50.53", mac: "080027000003",
            virtualbox__intnet: "S3-lg1"
        lg.vm.provider "virtualbox" do |v|
            v.memory = 8192
            v.cpus = 4
            v.customize ["modifyvm", :id, "--vrde", "on"]
            v.customize ["modifyvm", :id, "--vrdeport", "8022"]
        end
        lg.vm.provision "ansible" do |ansible| 
            ansible.playbook = "host-setup/loadGen/loadGen-playbook.yml"
        end
    end

    config.vm.define "loadGen2" do |lg|
        #RDP port 8443
        lg.vm.box = "leandrocdealmeida/ubuntu-vlc"
        lg.vm.hostname = "loadGen2"
        lg.vm.network "private_network", ip: "192.168.50.54", mac: "080027000004",
            virtualbox__intnet: "S2-lg2"
        lg.vm.provider "virtualbox" do |v|
            v.memory = 8192
            v.cpus = 4
            v.customize ["modifyvm", :id, "--vrde", "on"]
            v.customize ["modifyvm", :id, "--vrdeport", "8443"]
        end
        lg.vm.provision "ansible" do |ansible| 
            ansible.playbook = "host-setup/loadGen/loadGen-playbook.yml"
        end    
    end 

    config.vm.define "loadGen3" do |lg|
        #RDP port 19101
        lg.vm.box = "leandrocdealmeida/ubuntu-vlc"
        lg.vm.hostname = "loadGen3"
        lg.vm.network "private_network", ip: "192.168.50.55", mac: "080027000005",
            virtualbox__intnet: "S1-lg3"
        lg.vm.provider "virtualbox" do |v|
            v.memory = 8192
            v.cpus = 4
            v.customize ["modifyvm", :id, "--vrde", "on"]
            v.customize ["modifyvm", :id, "--vrdeport", "19101"]
        end
        lg.vm.provision "ansible" do |ansible| 
            ansible.playbook = "host-setup/loadGen/loadGen-playbook.yml"
        end 
    end
    
    config.vm.define "loadGen4" do |lg|
        #RDP port 19102
        lg.vm.box = "leandrocdealmeida/ubuntu-vlc"
        lg.vm.hostname = "loadGen4"
        lg.vm.network "private_network", ip: "192.168.50.56", mac: "080027000006",
            virtualbox__intnet: "S3-lg4"
        lg.vm.provider "virtualbox" do |v|
            v.memory = 8192
            v.cpus = 4
            v.customize ["modifyvm", :id, "--vrde", "on"]
            v.customize ["modifyvm", :id, "--vrdeport", "19102"]
        end
        lg.vm.provision "ansible" do |ansible| 
            ansible.playbook = "host-setup/loadGen/loadGen-playbook.yml"
        end 
    end
end
