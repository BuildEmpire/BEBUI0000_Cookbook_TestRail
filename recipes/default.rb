#
# Cookbook Name:: cookbook_testrail
# Recipe:: default
#

include_recipe 'apt'
include_recipe 'git'
include_recipe 'appbox'
include_recipe 'cookbook_testrail::users'
include_recipe 'cookbook_testrail::mysql'
include_recipe 'cookbook_testrail::php'
include_recipe 'cookbook_testrail::nginx'
include_recipe 'cookbook_testrail::htpasswd'
include_recipe 'cookbook_testrail::testrail'
include_recipe 'cookbook_testrail::newrelic'
include_recipe 'cookbook_testrail::rackspace'