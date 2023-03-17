#!/usr/bin/sh

#qemu-system-x86_64 -enable-kvm -boot menu=on -m 4G -cpu host -smp 2 -vga virtio -display sdl,gl=on -drive file=/data/antonio/cr/system.img -drive file=/data/antonio/cr/data.img,if=virtio -drive file=/data/antonio/Instaladores/windows.img,if=virtio -nic user,hostfwd=tcp::60022-:22 -device intel-hda 
qemu-system-x86_64 -enable-kvm -boot menu=on -m 4G -cpu host -smp 2 -vga virtio -display sdl,gl=on -drive file=/home/antonio/Personal/cr/system.img -drive file=/home/antonio/Personal/cr/data.img,if=virtio -nic user,hostfwd=tcp::60022-:22 -device intel-hda 

#qemu-system-x86_64 -enable-kvm -boot menu=on -m 4G -cpu host -smp 2 -vga virtio -display sdl,gl=on -drive file=/data/antonio/cr/system.img -drive file=/data/antonio/cr/data.img,if=virtio -nic user,hostfwd=tcp::60022-:22 -device intel-hda 

#-net user,hostfwd=tcp::2222-:22

#-redir tcp:2222:22

#sudo qemu-system-arm -M overo -m 256 -drive file=./overo_sd_alip.img,if=sd,cache=writeback -clock unix -serial stdio -device usb-kbd -device usb-mouse -redir tcp:2222::22

#qemu-system-x86_64 -enable-kvm -boot menu=on -drive file=/data/antonio/cr/cr.img -m 4G -cpu host -smp 2 -vga virtio -display sdl,gl=on

#qemu-system-x86_64 -enable-kvm -boot menu=on -drive file=/data/antonio/cr/cr.img,if=virtio -drive file=/data/antonio/cr/data.img,if=virtio -m 4G -cpu host -smp 2 -vga virtio -display sdl,gl=on -device virtio-serial-pci -spice unix=on,addr=/tmp/vm_spice.socket,disable-ticketing=on -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 -chardev spicevmc,id=spicechannel0,name=vdagent

#qemu-system-x86_64 -enable-kvm -boot menu=on -drive file=/data/antonio/cr/cr.img,file=/data/antonio/cr/data.img -m 4G -cpu host -smp 2 -vga virtio -display sdl,gl=on -device virtio-serial-pci -spice unix=on,addr=/tmp/vm_spice.socket,disable-ticketing=on -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 -chardev spicevmc,id=spicechannel0,name=vdagent

#-display spice-app
