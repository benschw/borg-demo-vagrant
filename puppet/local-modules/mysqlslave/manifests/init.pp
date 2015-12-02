class mysqlslave {

  class { 'mysql::server':
    restart          => true,
    root_password    => 'changeme',
    override_options => {
      'mysqld' => {
        'bind_address' => '0.0.0.0',
        'server-id'         => '2',
        'binlog-format'     => 'mixed',
        'log-bin'           => 'mysql-bin',
        'relay-log'         => 'mysql-relay-bin',
        'log-slave-updates' => '1',
        'read-only'         => '1',
        'replicate-do-db'   => ['borg'],
      },
    }
  } ->

  mysql::db { 'borg':
    ensure   => 'present',
    user     => 'borg',
    password => 'changeme',
    host     => '%',
    grant    => ['all'],
  }

  consul::service { 'mysql':
    tags   => ['mysql'],
    port   => 3306,
  }
}

