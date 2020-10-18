#!/usr/bin/env bash

set -eu

ETCD_VERSION=${ETCD_VERSION:-v3.4.13}

curl -L https://github.com/coreos/etcd/releases/download/$ETCD_VERSION/etcd-$ETCD_VERSION-linux-amd64.tar.gz -o etcd-$ETCD_VERSION-linux-amd64.tar.gz

tar xzvf etcd-$ETCD_VERSION-linux-amd64.tar.gz
rm etcd-$ETCD_VERSION-linux-amd64.tar.gz

cd etcd-$ETCD_VERSION-linux-amd64
sudo cp etcd /usr/local/bin/
sudo cp etcdctl /usr/local/bin/

rm -rf etcd-$ETCD_VERSION-linux-amd64

etcdctl version

# etcd configure file
ETCD_CONFIG=/etc/etcd.conf
echo "SELF_IP=$SELF_IP" >> $ETCD_CONFIG
echo "NODE_1_IP=$SELF_IP" >> $ETCD_CONFIG

# TODO must fix systemd https://docs.portworx.com/reference/knowledge-base/etcd-quick-setup/
ETCD_SYSTEMD=/etc/systemd/system/etcd3.service
cat << EOF >$ETCD_SYSTEMD
[Unit]
Description=etcd
Documentation=https://github.com/coreos/etcd
Conflicts=etcd.service
Conflicts=etcd2.service

[Service]
Type=notify
Restart=always
RestartSec=25s
LimitNOFILE=40000
TimeoutStartSec=20s
EnvironmentFile=/etc/etcd.conf
ExecStart=/bin/sh -c "etcd --name etcd-${SELF_IP} --data-dir /var/lib/etcd --quota-backend-bytes 8589934592 --auto-compaction-retention 3 --listen-client-urls http://${SELF_IP}:2379,http://localhost:2379 --advertise-client-urls http://${SELF_IP}:2379,http://localhost:2379 --listen-peer-urls http://${SELF_IP}:2380 --initial-advertise-peer-urls http://${SELF_IP}:2380 --initial-cluster 'etcd-${NODE_1_IP}=http://${NODE_1_IP}:2380' --initial-cluster-token my-etcd-token --initial-cluster-state new"

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable etcd3
sudo systemctl start etcd3