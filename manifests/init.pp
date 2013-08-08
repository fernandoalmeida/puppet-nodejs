# == Class: nodejs
#
# A Puppet module for installing and configuring Node.js.
#
# === Examples
#
#  include nodejs
#
# === Authors
#
# Fernando Almeida <fernando@fernandoalmeida.net>
# 
# === Copyright
# 
# Copyright 2013 Fernando Almeida, unless otherwise noted.
#
class nodejs {
  
  exec {"nodejs-ppa":
    command => "add-apt-repository ppa:chris-lea/node.js",
    unless  => "apt-key list | grep chrislea",
  }->
  exec {'nodejs-apt-get-update':
    command     => "apt-get update",
    refreshonly => true,
  }->
  package {'nodejs':
    ensure  => installed,
  }->
  package {'npm':
    ensure  => installed,
  }
  
}
