class roles::app {
	include apt
  class { 'consulclientprofile':
  } ->
  class { 'phpappprofile':
  }
}

