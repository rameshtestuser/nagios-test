class httpd {
    package {'httpd':
      ensure => installed,
      }
    service {'httpd':
      ensure => running,
      subscribe => Package['httpd'],
      }
}
