#
# Cookbook Name:: cookbook_testrail
# Recipe:: testrail
#


# Deduce the site and data directories
site_dir = "/home/apps/#{node['cookbook_testrail']['appname']}/current/public"
data_dir = "/home/apps/#{node['cookbook_testrail']['appname']}/shared/data"


# Only create the directories and config file if we're localhost.
if node['cookbook_testrail']['hostname'] == 'localhost'


end