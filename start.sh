#!/bin/bash

set -e
set -x

cat > /tmp/config.json << EOF

ui = ${ENABLE_UI:=false}
disable_mlock = true

storage "postgresql" {
  connection_url = "${DATABASE_URL:?}"
  ha_enabled = true
}
listener "tcp" {
 address = "0.0.0.0:$PORT"
 tls_disable = 1
}
EOF

nohup /usr/bin/unseal.sh & 

vault server --config=/tmp/config.json
exit 0
