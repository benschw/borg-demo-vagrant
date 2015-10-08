class roles::foo {
	include apt
  class { 'consulclientprofile':
  } ->
  class { 'springbootprofile':
  }
}

