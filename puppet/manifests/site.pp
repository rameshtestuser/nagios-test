file { "/etc/sudoers":
        owner => root, group => root, mode => 440
    }


node "puppet-client.localdomain" {
    include hosts
    include nagserver
}

node "puppet-client2.localdomain" {
    include httpd
    include nagclient
}

node "puppet-client3.localdomain", "puppet-client4.localdomain" {
    include mysql
    include nagclient
}


