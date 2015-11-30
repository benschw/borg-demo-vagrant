class rabbitmqserverprofile (
){


  class { '::rabbitmq':
    service_manage    => true,
    port              => '5672',
    admin_enable      => true,
  }

	consul::service { 'rabbitmq':
		tags   => ['rabbitmq'],
		port   => 5672,
	}

}


