describe file('/etc/grafana/provisioning/datasources/automatic.yml') do
    its('md5sum') { should eq 'e3d22511a75a5e07c7e3b766cb322719' }
end

describe file('/etc/prometheus/prometheus.yml') do
    its('md5sum') { should eq 'f2d50bed2d60a93074fbdc3e4dee42e1' }
end

describe file('/etc/selinux/config') do
    its('md5sum') { should eq 'd9011436206c5a6dd20bbfa8d3446fee' }
end