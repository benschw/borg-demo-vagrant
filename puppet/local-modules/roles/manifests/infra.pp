class roles::infra {
	include apt
  include consulserverprofile
  include rabbitmqserverprofile
  include chinchillaprofile
  include mysqlmaster
}
