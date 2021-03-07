FROM ubuntu:latest

RUN apt update && apt install -y iputils-ping net-tools traceroute dnsutils iperf nmap tcpdump curl vim nginx apache2-utils ftp lftp

RUN mkdir -p /var/www/var25.com.ua/html/www/test
RUN mkdir -p /var/www/var25.com.ua/html/web/test

COPY index_www.html /var/www/var25.com.ua/html/www/index.html
COPY index_web.html /var/www/var25.com.ua/html/web/index.html

COPY index_www.html /var/www/var25.com.ua/html/www/test/index.html
COPY index_web.html /var/www/var25.com.ua/html/web/test/index.html

COPY var25.com.ua /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/var25.com.ua /etc/nginx/sites-enabled/
RUN htpasswd -b -c /etc/nginx/.htpasswd user user

