#
# Cookbook Name:: cakephp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/shared/cake" do
	owner "vagrant"
	group "vagrant"
	mode 0755
	recursive true
end

template "localhost.conf" do
	path "/etc/httpd/conf.d/localhost.conf"
	source "localhost.conf.erb"
	owner "root"
	group "root"
	mode 0644
	notifies :reload, 'service[apache2]'
end

template "composer.json" do
	path "/shared/cake/composer.json"
	source "composer.json.erb"
	owner "vagrant"
	group "vagrant"
	mode 0644
end
