FROM alpine:latest

ARG FASTCGI_PASS=127.0.0.1:9000
ENV FASTCGI_PASS=${FASTCGI_PASS}

LABEL org.label-schema.name="tonysol/angie" \
    org.label-schema.description=":coffee: Docker image providing a web server for PHP applications" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.vcs-url="https://github.com/Tony-Sol/docker/tree/master/images/angie" \
    maintainer="Release Engineering Team <devops@tech.wbsrv.ru>"

RUN set -x \
    && apk add --no-cache ca-certificates curl gettext openssl \
    && curl -o /etc/apk/keys/angie-signing.rsa https://angie.software/keys/angie-signing.rsa \
    && echo "https://download.angie.software/angie/alpine/v$(egrep -o \
    '[0-9]+\.[0-9]+' /etc/alpine-release)/main" >> /etc/apk/repositories \
    && apk add --no-cache angie angie-module-geoip2 angie-module-njs \
    && rm /etc/apk/keys/angie-signing.rsa \
    && ln -sf /dev/stdout /var/log/angie/access.log \
    && ln -sf /dev/stderr /var/log/angie/error.log

COPY angie/ /etc/angie/
COPY docker-entrypoint.d/ /docker-entrypoint.d/
COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 8000

WORKDIR /etc/angie

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD ["angie", "-g", "daemon off;"]
