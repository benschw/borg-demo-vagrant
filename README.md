### Usage

	# grab this repo
	git clone https://github.com/benschw/borg-demo-vagrant.git
	cd borg-demo.git

	# clone the demo application
	git clone https://github.com/benschw/borg-demo.git

	# clone puppet dependencies and provision the demo cluster
	./deps.sh
	vagrant up

	# configure consul and the mysql master database on "dc0"
	vagrant ssh infra00
	/vagrant/consul.sh
	/vagrant/mysql-master.sh
	exit

	# configure consul and the mysql slave database on "dc1"
	vagrant ssh infra10
	/vagrant/consul.sh
	/vagrant/mysql-slave.sh
	exit



### links (once it's up)
- DC0
	- Dashboard
		- [rabbitmq](http://172.20.10.10:15672)
		- [consul](http://172.20.10.10:8500)
	- Demo
		- `curl -x POST http://172.20.10.11:8080/life-form -d '["Jean-Luc Picard"]'`
- DC1
	- Dashboard
		- [rabbitmq](http://172.20.20.10:15672)
		- [consul](http://172.20.20.10:8500)
	- Demo
		- `curl -x POST http://172.20.20.11:8080/life-form -d '["Jean-Luc Picard"]'`

