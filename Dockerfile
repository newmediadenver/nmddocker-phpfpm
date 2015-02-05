FROM newmedia/centos
ADD RPM-GPG-KEY-remi /etc/pki/tls/certs/RPM-GPG-KEY-remi
ADD RPM-GPG-KEY-EPEL-6 /etc/pki/tls/certs/RPM-GPG-KEY-EPEL-6
RUN \
yum install -y epel-release && \
rpm --import /etc/pki/tls/certs/RPM-GPG-KEY-remi && \
rpm --import /etc/pki/tls/certs/RPM-GPG-KEY-EPEL-6 && \
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
ADD etc /etc
RUN \
yum update -y && \
yum install -y php-fpm \
php-cli \
php-cli \
php-fpm php-gd \
php-imap \
php-ldap \
php-mbstring \
php-mcrypt \
php-mssql \
php-mysqlnd \
php-pdo \
php-pear \
php-pecl-memcache \
php-pecl-memcached \
php-soap \
php-pgsql \
php-xml && \
yum clean -y all && \
curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer
VOLUME ["/var/www"]
CMD ["/usr/sbin/php-fpm", "-F"]
EXPOSE 9000
