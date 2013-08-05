include_recipe 'database::mysql'

mysql_connection_info = {:host => "localhost",
                         :username => 'root',
                         :password => node['mysql']['server_root_password']}

mysql_database "cake" do
	connection mysql_connection_info
	action :create
end

mysql_database_user "cake" do
	connection mysql_connection_info
	password "passw0rd"
	database_name "cake"
	privileges [:all]
	action [:create, :grant]
end
