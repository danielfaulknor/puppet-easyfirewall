define easyFirewallRule(String[1] $name) {

    case $name {
        'web': {
             firewall { "101 Allow access to webserver":
                 port   => [80,443],
                 proto  => tcp,
                 action => accept,
             }
             firewall { "101 Allow access to webserver (v6)":
                 port   => [80,443],
                 proto  => tcp,
                 action => accept,
                 provider => "ip6tables",
             }
        }
        'mysql': {
             firewall { "101 Allow access to MySQL":
                 port   => 3306,
                 proto  => tcp,
                 action => accept,
             }
             firewall { "101 Allow access to MySQL (v6)":
                 port   => 3306,
                 proto  => tcp,
                 action => accept,
                 provider => "ip6tables",
             }
        }
        'ftp': {
             firewall { "102 Allow access to FTP":
                 port   => [21],
                 proto  => tcp,
                 action => accept,
             }
         }
    }
}
