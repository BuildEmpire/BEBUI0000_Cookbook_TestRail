#
# Cookbook Name:: cookbook_testrail
# Recipe:: testrail
#


# Deduce the site and data directories
site_dir = "/home/apps/#{node['cookbook_testrail']['appname']}/current/public"
shared_dir = "/home/apps/#{node['cookbook_testrail']['appname']}/shared"
attachments_dir = "#{shared_dir}/attachments"
reports_dir = "#{shared_dir}/reports"
logs_dir = "#{shared_dir}/logs"

# Create the cronic directory
# Cronic is a cron job report wrapper
directory File.dirname(node['cookbook_testrail']['cronic']) do
  action :create
  recursive true
end

# Create the cronic file
template node['cookbook_testrail']['cronic'] do
  source 'cronic.erb'
  mode '755'
end

# Create a cron job for the background task
cron 'TestRail Background Task' do
  hour node['cookbook_testrail']['cron_hour']
  minute node['cookbook_testrail']['cron_minute']
  command "#{node['cookbook_testrail']['cronic']} php #{site_dir}/task.php"
end

# Only create the directories and config file if we're localhost.
if node['cookbook_testrail']['hostname'] == 'localhost'

  # Create the shared directory
  directory shared_dir do
    owner 'www-data'
    group 'www-data'
    action :create
  end

  # Create the attachments directory
  directory attachments_dir do
    owner 'www-data'
    group 'www-data'
    action :create
  end

  # Create the reports directory
  directory reports_dir do
    owner 'www-data'
    group 'www-data'
    action :create
  end

  # Create the logs directory
  directory logs_dir do
    owner 'www-data'
    group 'www-data'
    action :create
  end

end