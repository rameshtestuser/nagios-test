class nagserver {

	package {"nagios":
	ensure => installed,
	}

	file {"servers-dir":
	path  	=>	"/etc/nagios/servers",
	ensure 	=>	present,
	mode	=>	755,
	recurse =>	true ,
	source	=>	"puppet:///extra_files/servers",
	require => Package[nagios]
	}

	file {"objects-dir":
	path  	=>	"/etc/nagios/objects",
	ensure 	=>	present,
	mode	=>	755,
	recurse =>	true ,
	source	=>	"puppet:///extra_files/objects",
        require => Package[nagios]
	}

	file {"nagios config":
	path  	=>	"/etc/nagios/nagios.cfg",
	ensure 	=>	present,
	mode	=>	755,
	source	=>	"puppet:///extra_files/nagios.cfg",
        require => Package[nagios]
	}

	service {"nagios":
	ensure	=>	running,
	subscribe	=> File['servers-dir', 'objects-dir', 'nagios config']
	}
}
