/usr/sbin/vmcleanup:
  file.managed:
    - mode: 0755
    - source: salt://cleanupscript/vmcleanup.sh
