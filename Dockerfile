FROM debian:buster

RUN apt-get update
RUN apt-get install -y vim zip
RUN apt-get install -y nginx
RUN apt-get install openssl
RUN apt-get install -y php7.3 php7.3-cli php7.3-fpm php-cgi php7.3-mysql \
	mariadb-server php-mbstring
RUN apt-get install -y wget

ADD ./srcs* ./

#CMD bash /initmain.sh
