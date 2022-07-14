$env:VAGRANT_EXPERIMENTAL="disks"
$env:UBUNTUI3_VM_NAME="ubuntu-i3"
$env:UBUNTUI3_VM_VERSION="1.0"

vagrant up
vagrant package

vagrant cloud publish -r --no-private adisadi/$env:UBUNTUI3_VM_NAME $env:UBUNTUI3_VM_VERSION virtualbox .\package.box

vagrant destroy -f
rm ./package.box