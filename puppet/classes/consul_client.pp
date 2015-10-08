class consul_client (
	$service_name = 'unknown',
	$health_path  = 'unknown',
) {

	#
	# DnsMasq to forward *.consul requests to local Consul DNS server
	#

	#
	# Consul Client Agent
	#
	package {["unzip"]:
		ensure => present,
	} ->

	class { 'consul':
		config_hash => {
			'datacenter' => 'dc1',
			'data_dir'   => '/opt/consul',
			'log_level'  => 'INFO',
			'node_name'  => $::hostname,
			'bind_addr'  => $::ipaddress_eth1,
			'server'     => false,
			'start_join' => [hiera('join_addr')],
		}
	} ->
	class { 'dnsmasq':
  }

  dnsmasq::dnsserver { 'forward-zone-consul':
		domain => "consul",
		ip     => "127.0.0.1",
    port   => "8600",
	}

	consul::service { $service_name:
		tags   => ['actuator'],
		port   => 8080,
    checks => [{
      script   => $health_path,
      interval => '5s',
    }]
	}

}
