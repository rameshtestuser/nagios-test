class hosts {
    package {'mysql-server':
      ensure => installed,
      }
    service {'php':
      ensure => running,
      subscribe => Package['mysql-server'],
      }
}
