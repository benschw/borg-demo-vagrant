class roles::infraslave {
	include apt
  include consulserverprofile
  include rabbitmqserverprofile
  include chinchillaprofile
  include mysqlslave
}

