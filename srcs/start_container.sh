mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=BE/ST=Bruxelles/L=Bruxelles/0=School 19/OU=ldoncker/CN=localhost"
cp -pr config_nginx etc/nginx/sites-available/default

chown -R www-data /var/www/*
chmod -R 755 var/www/*

mkdir var/www/localhost

service mysql start

echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

#wordpress
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mkdir var/www/localhost/wordpress
mv wordpress/* var/www/localhost/wordpress/
mv config_wordpress.php var/www/localhost/wordpress/wp-config.php

#phpmyadmin
mkdir var/www/localhost/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/localhost/phpmyadmin
mv config_phpmyadmin.php /var/www/localhost/phpmyadmin/config.inc.php

service nginx start
service php7.3-fpm start
bash
