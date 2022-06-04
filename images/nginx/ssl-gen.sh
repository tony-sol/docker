openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/certificate.key -out /etc/ssl/certs/certificate.crt
openssl dhparam -out /etc/nginx/ssl/dhparam.pem 4096
