class consulserverprofile (
  $start_join   = '',
){

	package {["unzip"]:
		ensure => present,
	} ->
	class { 'consul': 
		config_hash => {
			'datacenter' => 'dc1',
			'data_dir'   => '/opt/consul',
			'ui_dir'      => '/opt/consul/ui',
			'client_addr' => '0.0.0.0',
			'log_level'  => 'INFO',
			'node_name'  => $::hostname,
			'bind_addr'  => $::ipaddress_eth1,
			'bootstrap_expect' => 1,
			'start_join' => [$start_join],
			'server'     => true,
		}
	} ->
	class { 'dnsmasq':
  }

  dnsmasq::dnsserver { 'forward-zone-consul':
		domain => "consul",
		ip     => "127.0.0.1",
    port   => "8600",
	}

}

