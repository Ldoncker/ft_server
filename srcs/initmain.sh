mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=BE/ST=Bruxelles/L=Bruxelles/0=School 19/OU=ldoncker/CN=localhost"

service mysql start

chown -R www-data /var/www/*
chmod -R 755 var/www/*

mkdir var/www/localhost

#wordpress
#wget https://wordpress.org/latest.tar.gz
#tar -xvf latest.tar.gz
mkdir var/www/localhost/wordpress

service nginx start
service php7.3-fpm start
bash
