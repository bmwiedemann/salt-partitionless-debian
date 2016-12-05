#!/bin/sh
#xz -cd jessie.img.xz > jessie.img
dd if=jessie.img bs=4096 skip=256 of=nopart.img
test -e vmlinuz || sudo ./getkernel.sh nopart.img
echo "now install bootloader in vda"
kvm -m 1000 -drive file=nopart.img,if=virtio -vnc :22 -monitor stdio -net vde -net nic,macaddr=FE:FD:00:00:eb:14,model=virtio -kernel vmlinuz-3.16.0-4-amd64 -initrd initrd.img-3.16.0-4-amd64 -append "root=/dev/vda rw"
#dd if=noparttmp.img bs=4096 skip=256 of=nopart.img
#rm noparttmp.img
/usr/sbin/zerofree nopart.img
/sbin/e2fsck -f nopart.img
/sbin/resize2fs nopart.img 400000

