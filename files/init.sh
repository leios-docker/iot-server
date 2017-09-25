#!/bin/sh
if [ ! -f /etc/apache2/apache2.conf ]
then
  cp -Ra /etc/apache2.default/* /etc/apache2/
fi

touch /var/log/emoncms.log
chmod 666 /var/log/emoncms.log

chown www-data:root /var/lib/phpfiwa && \
chown www-data:root /var/lib/phpfina && \
chown www-data:root /var/lib/phptimeseries

. /etc/apache2/envvars
/usr/sbin/apache2 -DFOREGROUND
