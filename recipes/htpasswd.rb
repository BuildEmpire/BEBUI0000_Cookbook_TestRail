#
# Cookbook Name:: cookbook_testrail
# Recipe:: htpasswd
#

htpasswd_username = node['cookbook_testrail']['htpasswd']['username']
htpasswd_password = node['cookbook_testrail']['htpasswd']['password']
htpasswd_path = node['cookbook_testrail']['htpasswd']['path']

if htpasswd_username != '' && htpasswd_password != '' && htpasswd_path != ''

  htpasswd htpasswd_path do
    user htpasswd_username
    password htpasswd_password
    action :overwrite
  end

end