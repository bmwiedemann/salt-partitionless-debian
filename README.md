This repo contains scripts, configs and salt files
that help to create a partitionless image
with the current Debian stable (jessie)

To do that, you need to
- wget http://ftp.de.debian.org/debian/dists/jessie/main/installer-amd64/current/images/netboot/mini.iso
- qemu-img create jessie.img 2G
- kvm -m 1000 -drive file=jessie.img,if=virtio -cdrom mini.iso -vnc :20 -monitor stdio -net vde -net nic,macaddr=FE:FD:00:00:eb:14,model=virtio
- install a normal Debian with just one root partition to "jessie.img" using preseed.cfg and automatic install mode
- run scripts/mknopart.sh
- apply salt states in the middle using salt-ssh vm20b state.apply

