# Pull base image.
FROM ubuntu:16.04

# Install Nginx
RUN \
    apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:certbot/certbot && \
    apt-get update && \
    apt-get install -y apache2 mysql-client php libapache2-mod-php php-mysql php-curl php-pear php-dev php-mcrypt php-json vim python-certbot-apache && \
    rm -rf /var/lib/apt/lists/*

RUN \
    a2enmod rewrite

RUN \
    mkdir /var/lib/phpfiwa && \
    mkdir /var/lib/phpfina && \
    mkdir /var/lib/phptimeseries && \
    chown www-data:root /var/lib/phpfiwa && \
    chown www-data:root /var/lib/phpfina && \
    chown www-data:root /var/lib/phptimeseries
    
RUN cp -R /etc/apache2 /etc/apache2.default

# Define mountable directories.
VOLUME ["/etc/apache2/", "/var/www", "/var/log/apache2"]

# Define working directory.
WORKDIR /etc/apache2

COPY files/init.sh /init.sh

# Define default command.
CMD ["/init.sh"]

# Expose ports.
EXPOSE 80
