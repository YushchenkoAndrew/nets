server {
        listen 80;
        listen [::]:80;

        root /var/www/var25.com.ua/html/www;
        index index.html index.htm index.nginx-debian.html;

        server_name var25.com.ua www.var25.com.ua;

        location /test {
            root /var/www/var25.com.ua/html/www;
            allow 172.16.100.3;
            deny all;
        }
}

server {
        listen 80;
        listen [::]:80;

        root /var/www/var25.com.ua/html/web;
        index index.html index.htm index.nginx-debian.html;

        server_name var25.com.ua web.var25.com.ua;

        location /test {
            root /var/www/var25.com.ua/html/web;
            auth_basic "Restricted";
            auth_basic_user_file /etc/nginx/.htpasswd;
        }
}
