require 'facter'

Facter.add(:dnsmasq_version) do 
  setcode 'dnsmasq -v'
end
