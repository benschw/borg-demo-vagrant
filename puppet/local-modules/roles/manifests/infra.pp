class roles::infra {
	include apt
  include consulserverprofile
  include rabbitmqprofile
  include chinchillaprofile
  include mysqlprofile::mysqlmaster
}
