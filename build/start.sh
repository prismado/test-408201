#!/bin/bash

# ----- /usr/local/bin/start.sh

ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime
echo "Europe/Zurich" | tee /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

/etc/init.d/mariadb start

service cron start

echo -n `date` > /root/readme_407251.txt
echo " CPAN install: HTML::Mason::ApacheHandler" >> /root/readme_407251.txt

(echo yes | perl -MCPAN -e "install HTML::Mason::ApacheHandler") &
PID=$!

echo -n `date` >> /root/readme_407251.txt
echo " Installing (PID $PID) ... wait for 'Installed' this may take 5 minutes ..." >> /root/readme_407251.txt

wait $PID

echo -n `date`    >> /root/readme_407251.txt
echo " Installed" >> /root/readme_407251.txt

mkdir  /etc/apache2/mason && chown www-data /etc/apache2/mason

apache2ctl -D FOREGROUND