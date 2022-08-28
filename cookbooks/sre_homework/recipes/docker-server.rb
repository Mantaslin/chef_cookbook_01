#
# Cookbook:: sre_homework
# Recipe:: docker-server
#
# Copyright:: 2022, The Authors, All Rights Reserved.

file '/home/mli/chef-test.txt' do
    #content 'Welcome to Chef'
    action :delete
    end
