# InSpec test for recipe sre_homework::docker

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

control 'docker-server' do
    impact 1.0
    title 'Docker service should be installed and running'
    desc 'Docker service should be installed and running'
  
    describe service('docker') do
      it { should be_installed }
      it { should be_enabled }
      it { should be_running }
    end
  end