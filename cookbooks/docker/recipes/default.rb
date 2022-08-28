docker_service 'default' do
  action [:create, :start]
end

# Pull latest prometheus image
docker_image 'bitnami/prometheus' do
  tag 'latest'
  action :pull
end

docker_container 'prometheus' do
  repo 'bitnami/prometheus'
  tag 'latest'
  command '--config.file=/etc/prometheus/prometheus.yml'
  volume '/etc/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml:ro'
  port '9090:9090'
end

# Pull latest node-exporter image
docker_image 'bitnami/node-exporter' do
  tag 'latest'
  action :pull
end

docker_container 'node-exporter' do
  repo 'bitnami/node-exporter'
  tag 'latest'
  network_mode 'host'
  pid_mode 'host'
  volume '/:/host:ro,rslave'
  command '--path.rootfs=/host'
end

# Pull latest grafana image
docker_image 'grafana/grafana' do
  tag 'latest'
  action :pull
end

docker_container 'grafana' do
  repo 'grafana/grafana'
  tag 'latest'
  port '3000:3000'
  volume '/etc/grafana/provisioning:/etc/grafana/provisioning'
end
