extlinux:
  pkg.installed

grub-pc:
  pkg.installed

/boot/extlinux/syslinux.cfg:
  file.managed:
    - source: salt://bootloader/syslinux.cfg

install-extlinux:
  cmd.run:
    - name: "grub-install --force /dev/vda ; extlinux -i /boot/extlinux"
    - require:
      - file: /boot/extlinux/syslinux.cfg
      - pkg: extlinux
