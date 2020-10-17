#!/usr/bin/env bash

set -eu

# Install etcdpasswd

go get -u github.com/cybozu-go/etcdpasswd/...


# etcdpasswd config
ETCDPASSWD_CONFIG=/etc/etcdpasswd/config.yml
mkdir -p /etc/etcdpasswd/ && touch $ETCDPASSWD_CONFIG
cat << EOF >$ETCDPASSWD_CONFIG
endpoints:
  - http://${ETCD_IP}:2379
username: ${ETCD_USERNAME}
password: ${ETCD_PASSWORD}

#tls-cert-file: /etc/etcdpasswd/etcd.crt
#tls-key-file: /etc/etcdpasswd/etcd.key
EOF

sudo cp $GOPATH/bin/ep-agent /usr/local/sbin

# systemd
ETCDPASSWD_SYSTEMD=/etc/systemd/system/ep-agent.service
cat << EOF >$ETCDPASSWD_SYSTEMD
[Unit]
Description=etcdpasswd sync agent
After=network-online.target
Wants=network-online.target
ConditionPathExists=/etc/etcdpasswd/config.yml

[Service]
Type=simple
Restart=on-failure
RestartForceExitStatus=SIGPIPE
ExecStart=/usr/local/sbin/ep-agent -logformat json

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable ep-agent.service
sudo systemctl start ep-agent.service