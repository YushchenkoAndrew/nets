FROM ubuntu:latest

RUN apt update && apt install -y iputils-ping net-tools traceroute dnsutils iperf nmap tcpdump curl vim ftp lftp
