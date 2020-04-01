#!/usr/bin/env bash
set -e
domain="example.com"
certbot certonly --agree-tos --no-bootstrap --manual --manual-public-ip-logging-ok --manual-auth-hook ./authenticate --manual-cleanup-hook ./cleanup --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory -d "*.${domain}"
sudo ls /etc/letsencrypt/live/${domain}
