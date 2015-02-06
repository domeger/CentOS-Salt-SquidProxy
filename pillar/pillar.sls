squid:
  lookup:
    config:
      main:
        content: |
          acl manager proto cache_object
          acl localhost src 127.0.0.1/32 ::1
          acl to_localhost dst 127.0.0.0/8 0.0.0.0/32 ::1
          acl moa src 127.0.0.1
          acl SSL_ports port 443
          acl Safe_ports port 80    # http
          acl Safe_ports port 21    # ftp
          acl Safe_ports port 443   # https
          acl Safe_ports port 70    # gopher
          acl Safe_ports port 210   # wais
          acl Safe_ports port 1025-65535  # unregistered ports
          acl Safe_ports port 280   # http-mgmt
          acl Safe_ports port 488   # gss-http
          acl Safe_ports port 591   # filemaker
          acl Safe_ports port 777   # multiling http
          acl CONNECT method CONNECT
          http_access allow manager localhost
          http_access deny manager
          http_access allow moa
          http_access deny !Safe_ports
          http_access deny CONNECT !SSL_ports
          http_access allow localhost
          http_access deny all
          http_port 3128
          coredump_dir /var/spool/squid3
          refresh_pattern ^ftp:   1440  20% 10080
          refresh_pattern ^gopher:  1440  0%  1440
          refresh_pattern -i (/cgi-bin/|\?) 0 0%  0
          refresh_pattern .   0 20% 4320

          via off
          forwarded_for off

          request_header_access Allow allow all 
          request_header_access Authorization allow all 
          request_header_access WWW-Authenticate allow all 
          request_header_access Proxy-Authorization allow all 
          request_header_access Proxy-Authenticate allow all 
          request_header_access Cache-Control allow all 
          request_header_access Content-Encoding allow all 
          request_header_access Content-Length allow all 
          request_header_access Content-Type allow all 
          request_header_access Date allow all 
          request_header_access Expires allow all 
          request_header_access Host allow all 
          request_header_access If-Modified-Since allow all 
          request_header_access Last-Modified allow all 
          request_header_access Location allow all 
          request_header_access Pragma allow all 
          request_header_access Accept allow all 
          request_header_access Accept-Charset allow all 
          request_header_access Accept-Encoding allow all 
          request_header_access Accept-Language allow all 
          request_header_access Content-Language allow all 
          request_header_access Mime-Version allow all 
          request_header_access Retry-After allow all 
          request_header_access Title allow all 
          request_header_access Connection allow all 
          request_header_access Proxy-Connection allow all 
          request_header_access User-Agent allow all 
          request_header_access Cookie allow all 
          request_header_access All deny all