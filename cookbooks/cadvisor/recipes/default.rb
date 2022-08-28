# Encoding: utf-8
#
# Cookbook Name:: cadvisor
# Recipe:: default
#
# Copyright 2014, Paul Czarkowski
#

include_recipe 'docker::default'

cadvisor = node[:cadvisor]

docker_image cadvisor[:image] do
  tag cadvisor[:version]
  action :pull
end

docker_container cadvisor[:container] do
  repo cadvisor[:image]
  tag cadvisor[:version]
  port "#{cadvisor[:listen_ip]}:#{cadvisor[:listen_port]}:8080"
  volume ['/var/run:/var/run:rw', '/sys:/sys:ro', '/var/lib/docker/:/var/lib/docker:ro']
  container_name cadvisor[:container]
  detach true
  action :run
end
