FROM ubuntu:latest

RUN apt update && apt install -y iputils-ping net-tools traceroute dnsutils iperf nmap tcpdump curl vim ftp lftp vsftpd

COPY vsftpd.conf /etc/
COPY vsftpd.userlist /etc/

# Configure user dir
RUN mkdir /home/user/ftp/files -p
RUN useradd -d /home/user -s /bin/bash -p $(openssl passwd -1 user) user 

RUN chown user:user /home/user
RUN chown nobody:nogroup /home/user/ftp
RUN chown user:user /home/user/ftp/files
RUN chmod a-w /home/user/ftp

COPY test_user /home/user/ftp/files/test

# Configure anonymous dir
RUN mkdir /var/ftp/files -p

RUN chown nobody:nogroup /var/ftp
RUN chown ftp:ftp /var/ftp/files
RUN chmod a-w /var/ftp

COPY test_anonymous /var/ftp/files/test

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj="/C=UA/ST=Kiev/L=Kiev/O=OrganName/OU=FTP/CN= "

