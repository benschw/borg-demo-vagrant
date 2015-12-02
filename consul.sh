#!/bin/bash

USER=guest
PASS=guest


read -r -d '' CONN_CFG << EOF
user: $USER
password: $PASS
vhost: /
servicename: rabbitmq
EOF

read -r -d '' DC0_CFG << EOF
name: dc0
user: guest
password: guest
vhost: /
host: 172.20.10.10
port: 5672
EOF

read -r -d '' DC1_CFG << EOF
name: dc1
user: guest
password: guest
vhost: /
host: 172.20.20.10
port: 5672
EOF

read -r -d '' BORG_CFG << EOF
name: Borg
servicename: borg-demo
uri: /borg
method: POST
consumerstrategy: topic
queueconfig:
  prefetch: 5
  topicname: "borg-demo.default.#"
  queuename: borg
  exchangename: borg
EOF

read -r -d '' REP_CFG << EOF
name: Repeater
consumerstrategy: topic
deliverystrategy: topic-repeater
queueconfig:
  prefetch: 5
  topicname: "borg-demo.dc0.#"
  queuename: repeater-queue
  exchangename: borg
  connection: dc0
  exchangeout: borg-fwd
EOF

read -r -d '' BORG_FWD_CFG << EOF
name: BorgFwd
servicename: borg-demo
uri: /borg
method: POST
consumerstrategy: topic
queueconfig:
  prefetch: 5
  topicname: "borg-demo.#"
  queuename: borg-fwd
  exchangename: borg-fwd
EOF


echo "Configuring Consul"

curl -X PUT http://127.0.0.1:8500/v1/kv/chinchilla/connection.yaml -d "$CONN_CFG"
curl -X PUT http://127.0.0.1:8500/v1/kv/chinchilla/endpoints/borg.yaml -d "$BORG_CFG"

curl -X PUT http://127.0.0.1:8500/v1/kv/chinchilla/repeater/connections/dc0.yaml -d "$DC0_CFG"
curl -X PUT http://127.0.0.1:8500/v1/kv/chinchilla/repeater/connections/dc1.yaml -d "$DC1_CFG"
curl -X PUT http://127.0.0.1:8500/v1/kv/chinchilla/endpoints/repeater.yaml -d "$REP_CFG"
curl -X PUT http://127.0.0.1:8500/v1/kv/chinchilla/endpoints/borg-fwd.yaml -d "$BORG_FWD_CFG"

sudo service chinchilla restart
echo


