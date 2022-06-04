FROM nginx:latest

ARG NGINX_FASTCGI_PASS=127.0.0.1
ENV NGINX_FASTCGI_PASS=${NGINX_FASTCGI_PASS}

LABEL org.label-schema.name="tonysol/nginx" \
    org.label-schema.description=":coffee: Docker image providing a web server for PHP applications" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.vcs-url="https://github.com/Tony-Sol/docker/tree/master/images/nginx"

COPY ssl-gen.sh /ssl-gen.sh
COPY nginx/ /etc/nginx/
COPY ssl/ /etc/ssl/

EXPOSE 8000

WORKDIR /etc/nginx
