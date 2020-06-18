FROM mattrayner/lamp:latest-1804

# Add mCrypt extension to PHP
RUN apt-get update
RUN apt-get -y install gcc make autoconf libc-dev pkg-config
RUN apt-get -y install libmcrypt-dev
RUN apt-get -y install php7.4-dev

RUN printf "\n" | pecl install --nodeps mcrypt-snapshot

RUN bash -c "echo extension=/usr/lib/php/20190902/mcrypt.so > /etc/php/7.4/cli/conf.d/mcrypt.ini"
RUN bash -c "echo extension=/usr/lib/php/20190902/mcrypt.so > /etc/php/7.4/apache2/conf.d/mcrypt.ini"

CMD ["/run.sh"]
