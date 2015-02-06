squid:
  pkg.installed:

  service.running:
    - name: squid
    - enable: True

  file.managed:
    - name: '/etc/squid/squid.conf'
    - mode: 644
    - user: squid
    - group: wheel
    - watch_in:
        - service: squid


