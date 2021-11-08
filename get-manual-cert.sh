#!/usr/bin/env bash
set -eux
# certbot certonly --agree-tos --no-bootstrap --manual --manual-public-ip-logging-ok --manual-auth-hook ./authenticate --manual-cleanup-hook ./cleanup --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory -d "*.${domain}"
certbot certonly --agree-tos --no-bootstrap --manual --manual-public-ip-logging-ok --manual-auth-hook ./authenticate --manual-cleanup-hook ./cleanup --preferred-challenges dns -d "${CERT_CN}"
echo "Get cert by domain in folder /etc/letsencrypt/live/"
