#!/bin/sh
if [ ! -f /etc/apache2/apache2.conf ]
then
  cp -Ra /etc/apache2.default/* /etc/apache2/
fi

source /etc/apache2/envvars
/usr/sbin/apache2 -DFOREGROUND
