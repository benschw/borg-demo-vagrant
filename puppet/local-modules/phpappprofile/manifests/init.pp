class phpappprofile (
	$service_name = 'unknown',
	$svc_path     = 'unknown',
){


  package {['php5-cli', 'php5-curl', 'php5-mysql', ]:
    ensure => present,
  }

  class { 'phpfpm':
    poold_purge => true,
  }

  phpfpm::pool { 'main':
    listen_allowed_clients => '127.0.0.1',
    pm_max_requests        => 500,
    pm_status_path         => '/fpm-status',
    ping_path              => '/fpm-ping',
    env                    => {
      'FLIGLIO_ENV'        => 'vagrant',
    },
    php_admin_flag         => {
      'expose_php' => 'Off',
    },
  }

  class { 'nginx':
    server_tokens => off,
  }

  nginx::resource::vhost { "${::fqdn}_8080":
    www_root       => $svc_path,
    listen_port    => '8080',
    listen_options => 'default_server',
    try_files      => ['$uri', '$uri/', '/index.php?fliglio_request=$uri&$args'],
    underscores_in_headers => on,
  }
  nginx::resource::location { 'phpfpm_8080':
    location           => '~ [^/]\.php(/|$)',
    vhost              => "${::fqdn}_8080",
    www_root           => $svc_path,
    fastcgi            => '127.0.0.1:9000',
    fastcgi_split_path => '^(.+?\.php)(/.*)$',
  }


  nginx::resource::vhost { "${::fqdn}_8081":
    www_root       => $svc_path,
    listen_port    => '8081',
    listen_options => 'default_server',
    try_files      => ['$uri', '$uri/', '/index.php?fliglio_request=$uri&$args'],
    vhost_cfg_append => {
      'real_ip_header' => 'X-Forwarded-For',
      'fastcgi_param'  => 'FLIGLIO_INTERNAL_ACCESS_ONLY  on',
    },
  }
  nginx::resource::location { 'phpfpm_8081':
    location           => '~ [^/]\.php(/|$)',
    vhost              => "${::fqdn}_8081",
    www_root           => $svc_path,
    fastcgi            => '127.0.0.1:9000',
    fastcgi_split_path => '^(.+?\.php)(/.*)$',
  }

}


