require 'spec_helper'

describe 'django::package' do
  it { should have_resource_count(1) }

  it do
    should contain_package('python-django').with({
      'ensure' => 'present',
    })
  end
end
