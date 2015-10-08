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
			'log_level'  => 'INFO',
			'node_name'  => $::hostname,
			'bind_addr'  => $::ipaddress_eth1,
			'bootstrap_expect' => 3,
			'start_join' => [$start_join],
			'server'     => true,
		}
	}

}

