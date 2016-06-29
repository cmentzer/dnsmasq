require 'spec_helper'
describe 'dnsmasq' do
  context 'with default values for all parameters' do
    it { should contain_class('dnsmasq') }
  end
end
