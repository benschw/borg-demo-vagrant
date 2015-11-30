#!/bin/bash

# wget https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip
# unzip 0.5.2_linux_amd64.zip
# wget https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip
# unzip 0.5.2_web_ui.zip
# mv dist /tmp/web-ui



#USER=$(./chinchilla -keyring ./test-keys/.pubring.gpg encrypt guest)
#PASS=$(./chinchilla -keyring ./test-keys/.pubring.gpg encrypt guest)
USER=guest
PASS=guest


read -r -d '' CONN_CFG << EOF
user: $USER
password: $PASS
vhost: /
servicename: rabbitmq
EOF

read -r -d '' BORG_CFG << EOF
name: Borg
servicename: borg-demo
uri: /borg
method: POST
consumerstrategy: topic
queueconfig:
  prefetch: 5
  topicname: "#"
  queuename: borg
  exchangename: borg
EOF

read -r -d '' RABBIT_SVC << EOF
{
  "ID": "rabbitmq1",
  "Name": "rabbitmq",
  "Address": "172.20.20.20",
  "Port": 5672
}
EOF

echo "Configuring Consul"

curl -X PUT http://172.20.20.10:8500/v1/kv/chinchilla/connection.yaml -d "$CONN_CFG"
curl -X PUT http://172.20.20.10:8500/v1/kv/chinchilla/endpoints/borg.yaml -d "$BORG_CFG"
echo


