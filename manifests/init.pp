# Class: dnsmasq
# ===========================
#

class dnsmasq {
  
  package { 'dnsmasq':
    ensure => present,
  }

  service { 'dnsmasq.service':
    ensure => running,
    require => Package['dnsmasq']
  }

  file { '/etc/dnsmasq.conf':
    ensure  => file,
    require => Package['dnsmasq'],
    source  => 'puppet:///modules/dnsmasq/dnsmasq.conf'
  }
}
