#
# Cookbook Name:: cakephp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/var/www/cake" do
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

execute "timezone" do
	user "root"
	group "root"
	command "rm -f /etc/localtime; ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime"
end

template "composer.json" do
	path "/var/www/cake/composer.json"
	source "composer.json.erb"
	owner "vagrant"
	group "vagrant"
	mode 0644
end

execute "install_cake_core" do
	user "vagrant"
	group "vagrant"
	command "cd /var/www/cake && composer install"
end

execute "install_cake_app" do
	user "vagrant"
	group "vagrant"
	command "cd /var/www/cake && echo y | ./Vendor/bin/cake bake project HelloCake"
end
