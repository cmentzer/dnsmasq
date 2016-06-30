class dnsmasq::params {

  $config_template    = 'dnsmasq/dnsmasq.conf.epp'
  $config_path        = '/etc/dnsmasq.conf'
  $spoofed_sites      = []

}
