#
# Cookbook:: sre_homework
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

#include_recipe 'sre_homework::create-file.rb'
#include_recipe 'sre_homework::docker-server'
#include_recipe 'selinux::disabled'
template '/etc/selinux/config' do
  source 'config.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

directory 'prometheus' do
  path '/etc/prometheus/'
  recursive true
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/etc/prometheus/prometheus.yml' do
  source 'prometheus.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

directory 'grafana' do
  path '/etc/grafana/provisioning/datasources/'
  recursive true
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/etc/grafana/provisioning/datasources/automatic.yml' do
  source 'automatic.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

execute 'selinux set runtime status' do
  command 'setenforce 0'
end

include_recipe 'docker'
include_recipe 'cadvisor'
