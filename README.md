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


## mysql
- (http://nerdier.co.uk/2013/12/07/mysql-replication-with-puppet/)
- (https://www.digitalocean.com/community/tutorials/how-to-set-up-master-slave-replication-in-mysql)

CREATE TABLE IF NOT EXISTS ThreatReport (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) DEFAULT NULL,
  level VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB
