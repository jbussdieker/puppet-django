require 'spec_helper_acceptance'

describe 'django::package class', :unless => !["Ubuntu", "Debian"].include?(fact('operatingsystem')) do
  let(:manifest) {
    <<-EOS
      class { 'django::package':

      }
    EOS
  }

  describe 'running puppet code' do
    it 'should work with no errors' do
      apply_manifest(manifest, :catch_failures => true)
      expect(apply_manifest(manifest, :catch_changes => true).exit_code).to be_zero
    end
  end
end
