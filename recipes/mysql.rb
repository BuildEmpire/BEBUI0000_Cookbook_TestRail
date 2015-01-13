#
# Cookbook Name:: cookbook_testrail
# Recipe:: mysql
#

root_password = node['cookbook_testrail']['database']['root_password']
if root_password
  Chef::Log.info %(Set root password to node['cookbook_testrail']['database']['root_password'])
  Chef::Log.info root_password
  node.set['mysql']['server_root_password'] = root_password
  node.set['mysql']['server_repl_password'] = root_password
  node.set['mysql']['server_debian_password'] = root_password
end

# Include the mysql recipes
include_recipe "mysql::server"
include_recipe "mysql::client"
include_recipe "database::mysql"

# Include the mysql recipes
#mysql_service 'default' do
  #initial_root_password root_password
  #action [:create, :start]
#end

#mysql_client 'default' do
  #action :create
#end

# Setup the connection information
mysql_connection_info = {
    :host => node['cookbook_testrail']['database']['host'],
    :username => 'root',
    :password => root_password
}

mysql_database node['cookbook_testrail']['database']['database_name'] do
  connection mysql_connection_info
  encoding 'UTF8'
  collation 'utf8_unicode_ci'
  action :create
end

mysql_database_user node['cookbook_testrail']['database']['username'] do
  connection mysql_connection_info
  action [:create, :grant]
  password(node['cookbook_testrail']['database']['password'])
end

template '/etc/mysql/conf.d/mysite.cnf' do
  owner 'mysql'
  owner 'mysql'
  source 'mysite.cnf.erb'
  variables(
      :max_allowed_packet => node['cookbook_testrail']['mysql']['max_allowed_packet']
  )
  notifies :restart, 'mysql_service[default]'
end