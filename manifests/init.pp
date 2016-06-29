# Class: dnsmasq
# ===========================
#

class dnsmasq {
  
  package { 'dnsmasq':
    ensure => present,
  }

  service { 'dnsmasq.service':
    ensure => running,
    before => 'dnsmasq',
  }

  file { 'dnsmasq.conf':
    ensure => file,
  }
}
