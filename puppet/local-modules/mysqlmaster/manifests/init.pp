class mysqlmaster {

  class { 'mysql::server':
    restart          => true,
    root_password    => 'changeme',
    override_options => {
      'mysqld' => {
        'bind_address'                   => '0.0.0.0',
        'server-id'                      => '1',
        'binlog-format'                  => 'mixed',
        'log-bin'                        => 'mysql-bin',
        'datadir'                        => '/var/lib/mysql',
        'innodb_flush_log_at_trx_commit' => '1',
        'sync_binlog'                    => '1',
        'binlog-do-db'                   => ['borg'],
      },
      users => {
        'admin@*' => {
          ensure        => 'present',
          password_hash => mysql_password('changeme'),
        },
      },
      grants => {
        'admin@*/*' => {
          ensure     => 'present',
          options    => ['GRANT'],
          privileges => ['SELECT', 'INSERT', 'UPDATE', 'DELETE', 'REPLICATION SLAVE'],
          table      => '*.*',
          user       => 'admin@%'
        },
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
