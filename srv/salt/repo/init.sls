/etc/apt/sources.list:
  file.managed:
    - source: salt://repo/sources.list

run-apt-update:
  cmd.run:
    - name: "apt-get update"
    - onchanges:
      - file: /etc/apt/sources.list
