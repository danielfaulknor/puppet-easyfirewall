class easyfirewall::post {
firewallchain { 'INPUT:filter:IPv4':
  ensure => present,
  policy => drop,
  before => undef,
}
firewallchain { 'INPUT:filter:IPv6':
  ensure => present,
  policy => drop,
  before => undef,
}
firewallchain { 'FORWARD:filter:IPv6':
  ensure => present,
  policy => drop,
  before => undef,
}
}
