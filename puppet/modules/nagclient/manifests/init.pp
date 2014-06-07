class nagclient {
	$packages = [ "nrpe", "nagios-plugins-all", "openssl"]
	package { $packages: 
	ensure	=> installed
	}

	service {"nrpe":
	ensure	=>	running
	}
}
