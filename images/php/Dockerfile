FROM ubuntu:focal

ENV LANG ru_RU.utf8

ARG PHP_VERSION=8.1
ENV PHP_VERSION ${PHP_VERSION}

LABEL PHP=${PHP_VERSION} \
    org.label-schema.name="tonysol/php" \
    org.label-schema.description=":coffee: Docker image for build and test PHP applications" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.vcs-url="https://github.com/Tony-Sol/docker/tree/master/images/php"

RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    echo "UTC" | tee /etc/timezone && \
    apt-get update && \
    apt-get install -fy --no-install-recommends \
    apt-transport-https \
    apt-utils \
    lsb-release \
    software-properties-common \
    ca-certificates \
    bash-completion \
    binutils \
    coreutils \
    netbase \
    telnet \
    curl \
    wget \
    make \
    gettext \
    git \
    lsof \
    procps \
    htop \
    strace \
    ltrace \
    tree \
    unzip \
    vim \
    less \
    jq \
    librdkafka-dev \
    libyaml-dev \
    traceroute \
    iputils-ping

# RUN cd /usr/lib/aarch64-linux-gnu/ && ln -fs libffi.so.7 libffi.so.6 && cd
RUN add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -fy --no-install-recommends --ignore-missing \
    php${PHP_VERSION} \
    php${PHP_VERSION}-apcu \
    php${PHP_VERSION}-amqp \
    php${PHP_VERSION}-bcmath \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-common \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dba \
    php${PHP_VERSION}-dev \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-gd \
    php${PHP_VERSION}-grpc \
    php${PHP_VERSION}-imap \
    php${PHP_VERSION}-intl \
    php${PHP_VERSION}-ldap \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-mcrypt \
    php${PHP_VERSION}-memcache \
    php${PHP_VERSION}-memcached \
    php${PHP_VERSION}-mysql \
    php${PHP_VERSION}-pgsql \
    php${PHP_VERSION}-redis \
    php${PHP_VERSION}-soap \
    php${PHP_VERSION}-xdebug \
    php${PHP_VERSION}-xmlrpc \
    php${PHP_VERSION}-xsl \
    php${PHP_VERSION}-zip \
    php-pear && \
    curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/bin --filename=composer && \
    composer completion bash > /etc/bash_completion.d/composer

COPY ${PHP_VERSION}/ /etc/php/${PHP_VERSION}/

COPY composer.* /tmp/

RUN pecl channel-update pecl.php.net && mkdir -p /tmp/pear/cache && \
    for pecl_module in ds protobuf rdkafka yaml; do \
        pecl install ${pecl_module}; \
            for php_sapi in cli fpm; do \
            ln -s /etc/php/${PHP_VERSION}/mods-available/${pecl_module}.ini /etc/php/${PHP_VERSION}/${php_sapi}/conf.d/20-${pecl_module}.ini; \
        done; \
    done

EXPOSE 9000 9003

WORKDIR /app

CMD php-fpm${PHP_VERSION} -F
