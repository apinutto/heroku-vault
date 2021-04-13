#!/bin/bash

set -e
set -x

cat > /tmp/config.json << EOF

ui = ${ENABLE_UI}
disable_mlock = true

storage "postgresql" {
  connection_url = "${DATABASE_URL:?}"
}
listener "tcp" {
 address = "0.0.0.0:$PORT"
 tls_disable = 1
}
EOF

vault server --config=/tmp/config.json
exit 0
