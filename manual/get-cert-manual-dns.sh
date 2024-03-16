#!/bin/bash
set -eu
if [[ "$#" != 1 ]]; then
  echo "Usage: $0 <your.domain.com>"
  echo "Example: $0 foo.example.com"
  echo "Example: $0 *.example.com"
  exit
fi
domain=$1

echo "$domain"

certbot certonly --manual --preferred-challenges dns \
  --logs-dir ./logs --work-dir  ./work --config-dir ./config \
  --agree-tos --no-bootstrap --manual-public-ip-logging-ok \
  -d "${domain}"

domain=$(echo $domain | sed 's/\*.//g')

echo "cert/key located in ./config/live/$domain/"
