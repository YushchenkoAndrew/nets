FROM ubuntu:latest

RUN apt update && apt install -y iputils-ping net-tools traceroute dnsutils iperf nmap tcpdump curl vim bind9 bind9utils bind9-doc ftp lftp telnet

RUN apt install quagga iptables -y

RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

# Configuration
COPY config/vtysh.conf.sample /etc/quagga/vtysh.conf
COPY config/zebra.conf.sample /etc/quagga/zebra.conf
COPY config/bgpd.conf.sample /etc/quagga/bgpd.conf
COPY config/ospfd.conf.sample /etc/quagga/ospfd.conf
COPY config/ripd.conf.sample /etc/quagga/ripd.conf


RUN chown quagga:quagga /etc/quagga/*.conf
RUN chown quagga:quaggavty /etc/quagga/vtysh.conf
RUN chmod 640 /etc/quagga/*.conf

