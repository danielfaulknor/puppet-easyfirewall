require 'spec_helper'
describe 'easyfirewall' do
  context 'with default values for all parameters' do
    it { should contain_class('easyfirewall') }
  end
end
