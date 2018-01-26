install-vbox:
	apt install libsdl1.2debian virtualbox-5.2 -y

register-vm:
	./setup.sh

launch-vm:
	VBoxManage startvm w2k8_r2_base
