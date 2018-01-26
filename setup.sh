echo 'Setting up Windows Server 2008'

VBoxManage createvm --name "w2k8_r2_base" --ostype Windows2008_64 --register 2>/dev/null

VBoxManage modifyvm "w2k8_r2_base" --memory 8192 --cpus 2 --vram 128 --acpi on --boot1 dvd --nic1 nat

echo $WINBOX_LOCATION
VBoxManage createhd --filename $WINBOX_LOCATION/w2k8_r2_base.vdi --size 30000

VBoxManage storagectl "w2k8_r2_base" --name "SATA" --add sata

VBoxManage storageattach "w2k8_r2_base" --storagectl "SATA" --port 0 --device 0 --type hdd --medium $WINBOX_LOCATION/w2k8_r2_base.vdi

VBoxManage storagectl "w2k8_r2_base" --name "IDE" --add ide

VBoxManage storageattach "w2k8_r2_base" --storagectl "IDE" --port 0 --device 0 --type dvddrive --medium ~/windows-box-setup/en_windows_server_2008_r2_standard_enterprise_datacenter_and_web_with_sp1_x64_dvd_617601.iso

echo 'done'
