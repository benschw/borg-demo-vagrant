### Usage

	./deps.sh
	git clone git@github.com:benschw/borg-demo.git
	vagrant up
	./consul.sh
	vagrant ssh infra0
	infra0 $ sudo service chinchilla restart


### links (once it's up)
- Dashboard
	- [rabbitmq](http://172.20.20.10:15672)
	- [consul](http://172.20.20.10:8500)
- Demo
	- [demo](http://172.20.20.11:8080/test?msg=hello)
