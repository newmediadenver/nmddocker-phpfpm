FROM newmedia/centos
ADD RPM-GPG-KEY-remi /etc/pki/tls/certs/RPM-GPG-KEY-remi
RUN \
yum install -y epel-release && \
rpm --import /etc/pki/tls/certs/RPM-GPG-KEY-remi && \
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
ADD etc /etc
RUN \
yum update -y && \
yum install -y php-fpm php-cli && \
yum clean -y all
