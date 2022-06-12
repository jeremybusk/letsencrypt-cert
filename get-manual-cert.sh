#!/bin/bash
set -eu

if [[ "$#" != 1 ]]; then
  echo "Usage: $0 <myhost.example.com>"
  echo "Example: $0 myhost.dev.example.com"
  exit
fi
export CERT_CN="$1"

certbot certonly --agree-tos --no-bootstrap --manual \
  --manual-public-ip-logging-ok --manual-auth-hook ./authenticate \
  --manual-cleanup-hook ./cleanup --preferred-challenges dns -d "${CERT_CN}" \
  --logs-dir ./logs --work-dir  ./work --config-dir ./config --config cli.ini

echo "Get cert by domain in folder ~/config/live/"
