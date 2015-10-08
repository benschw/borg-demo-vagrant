class consulwebuiprofile (
  $start_join   = '',
){

	package {["unzip"]:
		ensure => present,
	} ->
	class { 'consul':
	  	config_hash => {
			'datacenter'  => 'dc1',
			'data_dir'    => '/opt/consul',
			'ui_dir'      => '/opt/consul/ui',
			'client_addr' => '0.0.0.0',
			'log_level'   => 'INFO',
			'node_name'   => 'webui',
			'bind_addr'   => $::ipaddress_eth1,
			'start_join' => [$start_join],
			'server'      => true,
		}
	}

}
