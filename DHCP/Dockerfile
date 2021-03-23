FROM ubuntu:latest

RUN apt update && apt install -y iputils-ping net-tools traceroute dnsutils iperf nmap tcpdump curl vim bind9 bind9utils bind9-doc ftp lftp isc-dhcp-server

# Configuration
COPY dhcpd.conf /etc/dhcp/
COPY isc-dhcp-server /etc/default/

