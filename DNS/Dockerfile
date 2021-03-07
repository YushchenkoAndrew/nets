FROM ubuntu:latest

RUN apt update && apt install -y iputils-ping net-tools traceroute dnsutils iperf nmap tcpdump curl vim bind9 bind9utils bind9-doc

RUN echo 'OPTIONS="-4 -u bind"' > /etc/default/bind9

# Configuration
COPY named.conf.options /etc/bind/
COPY named.conf.local /etc/bind/
COPY db.var25.com.ua /etc/bind/zones/

