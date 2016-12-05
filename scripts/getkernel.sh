#!/bin/bash
img=$1
m=/mnt/2
mount -o loop $img $m
cp $m/boot/{vmlinuz-*,initrd.img*} .
umount $m
