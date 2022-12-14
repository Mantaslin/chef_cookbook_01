# Encoding: utf-8
name             'cadvisor'
maintainer       'Paul Czarkowski'
maintainer_email 'username.taken@gmail.com'
license          'Apache2'
description      'Installs/Configures cadvisor'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

%w(ubuntu debian).each do |os|
  supports os
end

%w(centos).each do |os|
  supports os
end

%w(docker).each do |ckbk|
  depends ckbk
end
