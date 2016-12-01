extlinux:
  pkg.installed

grub-pc:
  pkg.installed

/boot/extlinux:
  file.directory:
    - create: True

/boot/extlinux/syslinux.cfg:
  file.managed:
    - source: salt://bootloader/syslinux.cfg
    - require:
      - file: /boot/extlinux

install-extlinux:
  cmd.run:
    - name: "grub-install --force /dev/vda ; cp -a /usr/lib/syslinux/modules/bios/*.c32 /boot/extlinux ; extlinux -i /boot/extlinux"
    - require:
      - file: /boot/extlinux/syslinux.cfg
      - pkg: extlinux
    - onchanges:
      - pkg: extlinux
      - pkg: grub-pc
