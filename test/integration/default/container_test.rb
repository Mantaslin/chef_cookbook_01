describe docker_container(name: 'prometheus') do
    it { should exist }
    it { should be_running }
    its('image') { should eq 'bitnami/prometheus:latest' }
    its('tag') { should eq 'latest' }
    its('ports') { should eq '0.0.0.0:9090->9090/tcp' }
    its('command') { should eq '/opt/bitnami/prometheus/bin/prometheus --config.file=/etc/prometheus/prometheus.yml' }
end

describe docker_container(name: 'grafana') do
    it { should exist }
    it { should be_running }
    its('image') { should eq 'grafana/grafana:latest' }
    its('tag') { should eq 'latest' }
    its('ports') { should eq '0.0.0.0:3000->3000/tcp' }
end

describe docker_container(name: 'cadvisor') do
    it { should exist }
    it { should be_running }
    its('image') { should eq 'gcr.io/cadvisor/cadvisor:latest' }
    its('tag') { should eq 'latest' }
    its('ports') { should eq '0.0.0.0:8080->8080/tcp' }
end

describe docker_container(name: 'node-exporter') do
    it { should exist }
    it { should be_running }
    its('image') { should eq 'bitnami/node-exporter:latest' }
    its('tag') { should eq 'latest' }
    its('command') { should eq '/opt/bitnami/node-exporter/bin/node_exporter --path.rootfs=/host' }
end