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

  file { 'dnsmasq.conf':
    ensure  => file,
    require => Package['dnsmasq']
  }
}
