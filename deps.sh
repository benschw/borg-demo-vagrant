#!/bin/sh

rm -rf puppet/modules/*

# common
git clone git://github.com/puppetlabs/puppetlabs-stdlib.git puppet/modules/stdlib
git clone https://github.com/puppetlabs/puppetlabs-apt puppet/modules/apt

# consul
git clone https://github.com/solarkennedy/puppet-consul puppet/modules/consul
git clone git@github.com:nanliu/puppet-staging.git puppet/modules/staging

# dnsmasq
git clone https://github.com/rlex/puppet-dnsmasq.git puppet/modules/dnsmasq
git clone https://github.com/puppetlabs/puppetlabs-concat.git puppet/modules/concat

# rabbitmq
git clone https://github.com/puppetlabs/puppetlabs-rabbitmq.git puppet/modules/rabbitmq

# nginx/php
git clone https://github.com/Slashbunny/puppet-phpfpm.git puppet/modules/phpfpm
git clone https://github.com/jfryman/puppet-nginx.git puppet/modules/nginx

# mysql
git clone https://github.com/puppetlabs/puppetlabs-mysql.git puppet/modules/mysql
