#!/bin/bash

set -e
set -x

cat > /tmp/config.json << EOF
disable_mlock = true
storage "postgresql" {
  connection_url = "${DATABASE_URL:?}"
}
listener "tcp" {
 address = "127.0.0.1:8080"
 tls_disable = 1
}
EOF

vault server --config=/tmp/config.json
exit 0
