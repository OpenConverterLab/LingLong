#linglong base cache
FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y ca-certificates &&\
    echo "deb [trusted=yes] https://ci.deepin.com/repo/obs/linglong:/CI:/release/xUbuntu_24.04/ ./" | tee /etc/apt/sources.list.d/linglong.list && \
    apt-get update && \
    apt-get install -y linglong-bin linglong-builder linglong-box && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN cat <<'EOF' > linglong.yaml
version: "1"

package:
  id: ID
  name: NAME
  version: 0.0.0.0
  kind: app
  description: |

base: org.deepin.base/23.1.0

command:
  - test

source:
  - kind: local
    name: NAME

build: |
EOF

# RUN ll-builder build
