class roles::demo {
	include apt
  class { 'consulclientprofile':
  } ->
  class { 'springbootprofile':
  }
}

