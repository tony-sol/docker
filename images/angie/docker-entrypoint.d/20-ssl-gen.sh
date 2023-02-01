#!/bin/sh

set -eu

entrypoint_log() {
    if [ -z "${QUIET_LOGS}" ]; then
        while read IN; do echo $IN; done
    fi
}

generate_ssl_certificates() {
    local default_subj="${ANGIE_CERT_SUBJ:-/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com}"

    openssl req \
        -x509 \
        -nodes \
        -days 365 \
        -newkey rsa:4098 \
        -keyout /etc/ssl/private/certificate.key \
        -out /etc/ssl/certs/certificate.crt \
        -subj "$default_subj" \
    2>&1 | QUIET_LOGS=${ANGIE_ENTRYPOINT_QUIET_LOGS:-} entrypoint_log

    openssl dhparam \
        -out /etc/ssl/certs/dhparam.pem \
        1024 \
    2>&1 | QUIET_LOGS=${ANGIE_ENTRYPOINT_QUIET_LOGS:-} entrypoint_log
}

generate_ssl_certificates

exit 0
