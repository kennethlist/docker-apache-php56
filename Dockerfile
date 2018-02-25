FROM debian:jessie

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get install -y \
      locales \
      apache2 \
      php5 \
      php5-cli \
      libapache2-mod-php5 \
      php5-gd \
      php5-json \
      php5-ldap \
      php5-mysql \
      php5-pgsql \
      php5-curl \
      php5-xdebug \
      php5-mcrypt \
      graphviz \
      ssmtp

COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY xdebug.ini /etc/php5/mods-available/xdebug.ini
COPY ssmtp.conf /etc/ssmtp/ssmtp.conf

COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/local/bin/run"]
