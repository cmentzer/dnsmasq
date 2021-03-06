# Class: dnsmasq
# ===========================
#

class dnsmasq (

  $spoofed_sites      = $dnsmasq::params::spoofed_sites,
  $config_template    = $dnsmasq::params::config_template,
  $config_path        = $dnsmasq::params::config_path

) inherits dnsmasq::params {
  
  # ensure the dnsmasq package is present
  package { 'dnsmasq':
    ensure => present,
  }

  # ensure that the dnsmasq service is running 
  # provided the package is installed. If the config file 
  # is changed, restart the service
  service { 'dnsmasq.service':
    ensure    => running,
    require   => Package['dnsmasq'],
    subscribe => File['/etc/dnsmasq.conf']
  }

  # ensure that the config file is present and provide defaults 
  # for the spoofed hostnames.
  file { $config_path:
    ensure  => file,
    require => Package['dnsmasq'],
    content => epp($config_template,
      { 
        'spoofed_sites' => $spoofed_sites,
      })
	}
}
