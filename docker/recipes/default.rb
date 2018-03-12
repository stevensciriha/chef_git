#
# Cookbook Name:: learn_chef_apache2
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#bash 'update_sudoers' do
#  cwd '/etc'
#  code <<-EOH
#sed -i 's/Defaults    requiretty/#Defaults    requiretty/g' sudoers    
#EOH
#  only_if { ::File.exist?("/etc/sudoers") }
#end


#execute 'yum_update_upgrade' do
#command 'sudo yum update && sudo yum upgrade'
#end

#package 'httpd'

#service 'httpd' do
#  supports status: true
#  action [:enable, :start]
#end

#template '/var/www/html/index.html' do # ~FC033
#  source 'index.html.erb'
#end

#docker_image 'stevensciriha/ubuntucustom2'
docker_service 'default' do
  action [:create, :start]
end
docker_image 'stevensciriha/ubuntucustom2'
docker_container 'stevecontainer' do
  repo 'stevensciriha/ubuntucustom2'
  tag 'latest'
  port '880:80'
  host_name 'steve'
end
