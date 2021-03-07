;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     ns1.var25.com.ua. root.var25.com.ua. (
                              3         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL

; name server - NS records
        IN      NS      ns1.var25.com.ua.

; name server - A records
ns1.var25.com.ua.       IN      A       172.16.100.2

www.var25.com.ua.       IN      A       172.16.100.3
web.var25.com.ua.       IN      A       172.16.100.3
ftp.var25.com.ua.       IN      A       172.16.100.4
