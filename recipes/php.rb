#
# Cookbook Name:: cookbook_testrail
# Recipe:: php
#

package "unzip"

# Set the php initialisation options
node.set['php']['directives'] = {
    'date.timezone' => 'Europe/London',
    'short_open_tag' => 'Off',
    'magic_quotes_gpc' => 'Off',
    'register_globals' => 'Off',
    'session.autostart' => 'Off',
    'upload_max_filesize' => '100M',
    'post_max_size' => '100M',
    'max_execution_time' => '600',
    'opcache.enable' => '1',
    'oci8.statement_cache_size' => 0
}

node.set['php-fpm']['pools'] = [
    {
        :name => "www",
        :listen => "127.0.0.1:9001",
        :php_options => {
            'php_admin_value[date.timezone]' => 'Europe/London',
            'php_admin_flag[short_open_tag]' => 'off',
            'php_admin_flag[magic_quotes_gpc]' => 'off',
            'php_admin_flag[register_globals]' => 'off',
            'php_admin_flag[session.autostart]' => 'off',
            'php_admin_value[upload_max_filesize]' => '100M',
            'php_admin_value[post_max_size]' => '100M',
            'php_admin_value[max_execution_time]' => 600,
            'php_admin_value[opcache.enable]' => 1,
            'php_admin_value[oci8.statement_cache_size]' => 0
        }
    }
]


include_recipe "php"
include_recipe "php-fpm"

package "php5-curl" do
  action :install
end

package "php5-mysql" do
  action :install
end

Array(node["cookbook_testrail"]["php_packages"]).each_with_index do |package_name, index|
  package package_name do
    action :install
  end
end

Array(node["cookbook_testrail"]["php_pears"]).each_with_index do |pear_name, index|
  php_pear pear_name do
    action :install
  end
end




archive_directory = Chef::Config[:file_cache_path]
zip_name = "TeamCity-BuildAgent.zip"
zip_dest = "#{archive_directory}/#{zip_name}"
zip_source = node['teamcity_build_agent']['server_url'] + "/update/buildAgent.zip"
install_dir = "/opt/teamcity/buildAgent"

# Download the build agent from the teamcity server
remote_file zip_dest do
  source zip_source
  action :create_if_missing
end

# Remove the installation directory
directory install_dir do
  action :delete
  recursive true
end

# Create the installation directory
directory install_dir do
  mode "0755"
  action :create
end

# Unzip the build agent into the installation directory
bash "unzip-buildAgent" do
  code <<-EOH
    unzip #{zip_dest} -d #{install_dir}
  EOH
end

# Remove the installation zip
file zip_dest do
  action :delete
end




service "php-fpm" do
  action :restart
end