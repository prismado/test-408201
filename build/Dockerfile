FROM debian-407231-3:latest
# FROM debian:12

# Installiere ...
RUN apt-get update && apt-get install -y \
    apache2 \
    mariadb-server \
    php php-json php-mbstring php-zip php-mysql php-bz2 \
    libmason-perl libapache2-mod-perl2 libcgi-pm-perl libdbd-mysql-perl \
    make gcc vim cron \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Kopiere eigene Konfigurationen oder Webseiten (optional)
# COPY ./my-website/ /var/www/html/
COPY ./start.sh                 /usr/local/bin/
COPY ./_motd                    /usr/local/bin/motd
COPY ./motd                     /etc/
COPY ./_.bashrc                 /root/.bashrc
COPY ./bash.bashrc              /etc/
COPY ./_.vimrc                  /root/.vimrc
COPY ./000-default.conf         /etc/apache2/sites-available/000-default.conf
# COPY ./000-default.conf               /etc/apache2/sites-available/000-default_new.conf

# Expose the HTTP port
EXPOSE 80

ENV x_docker_im=deb12

# Start Apache2 in the foreground
# CMD ["apache2ctl", "-D", "FOREGROUND"]
# XX CMD service apache2 start && service mysql start && tail -f /dev/null
# XX CMD ["sh", "-c", "service apache2 start && service mysql start && tail -f /dev/null"]

CMD ["/usr/local/bin/start.sh"]