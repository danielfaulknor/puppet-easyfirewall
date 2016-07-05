class easyfirewall::pre {
  Firewall {
    require => undef,
  }
   # Default firewall rules
  firewall { '000 accept all icmp':
    proto   => 'icmp',
    action  => 'accept',
  }->
  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }->
  firewall { "002 reject local traffic not on loopback interface":
    iniface     => '! lo',
    proto       => 'all',
    destination => '127.0.0.1/8',
    action      => 'reject',
  }->
  firewall { '003 accept related established rules':
    proto   => 'all',
    state => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  }->
  firewall { "004 Allow inbound SSH (v4)":
    dport     => 22,
    proto    => tcp,
    action   => accept,
  }

  # Default firewall rules (v6)
  firewall { '000 accept all icmp (v6)':
    proto   => 'icmp',
    action  => 'accept',
    provider => 'ip6tables',
  }->
  # Default firewall rules (v6)
  firewall { '000 accept all icmpv6 (v6)':
    proto   => 'ipv6-icmp',
    action  => 'accept',
    provider => 'ip6tables',
  }->
  firewall { '001 accept all to lo interface (v6)':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
    provider => 'ip6tables',
  }->
  firewall { '003 accept related established rules (v6)':
    proto   => 'all',
    state => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
    provider => 'ip6tables',
  }->
  firewall { '004 accept related established rules (v6)':
    chain   => 'FORWARD',
    proto   => 'all',
    state => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
    provider => 'ip6tables',
  }->
  firewall { "004 Allow inbound SSH (v6)":
    dport     => 22,
    proto    => tcp,
    action   => accept,
    provider => 'ip6tables',
  }->
  firewall { "004 Allow Multicast (v6)":
    destination => 'ff00::/8',
    action      => accept,
    provider    => 'ip6tables',
  }->
  firewall { "004 Allow Link Local (v6)":
    destination => 'fe80::/10',
    action      => accept,
    provider    => 'ip6tables',
  }
}
