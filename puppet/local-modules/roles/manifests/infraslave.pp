class roles::infraslave {
	include apt
  include consulserverprofile
  include rabbitmqprofile
  include chinchillaprofile
  include mysqlprofile::mysqlslave
}

