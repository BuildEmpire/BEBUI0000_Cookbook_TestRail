default['cookbook_testrail']['appname'] = 'testrail'
default['cookbook_testrail']['hostname'] = 'localhost'
default['cookbook_testrail']['listen_port'] = '80'
default['cookbook_testrail']['user'] = 'www-data'
default['cookbook_testrail']['group'] = 'www-data'
default['cookbook_testrail']['address'] = 'http://localhost'

default['cookbook_testrail']['database']['type'] = 'mysql'
default['cookbook_testrail']['database']['host'] = 'localhost'
default['cookbook_testrail']['database']['root_password'] = nil
default['cookbook_testrail']['database']['database_name'] = 'testrail'
default['cookbook_testrail']['database']['username'] = 'testrail'
default['cookbook_testrail']['database']['password'] = ''

default['cookbook_testrail']['default_config']['nginx']['template_name'] = 'nginx_vhost.conf.erb'
default['cookbook_testrail']['default_config']['nginx']['template_cookbook'] = 'cookbook_testrail'
default['cookbook_testrail']['default_config']['nginx']['listen_port'] = '80'

default['cookbook_testrail']['cronic'] = '/opt/bin/cronic'
default['cookbook_testrail']['cron_hour'] = '*'
default['cookbook_testrail']['cron_minute'] = '*'

default['cookbook_testrail']['php_packages'] = []
default['cookbook_testrail']['php_pears'] = []
default['cookbook_testrail']['ioncube']['download_url'] = 'http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.zip'

default['cookbook_testrail']['mysql']['max_allowed_packet'] = '128M'

default['cookbook_testrail']['htpasswd']['username'] = ''
default['cookbook_testrail']['htpasswd']['password'] = ''
default['cookbook_testrail']['htpasswd']['path'] = ''

default['cookbook_testrail']['newrelic']['license_key'] = nil

default['cookbook_testrail']['rackspace']['username'] = ''
default['cookbook_testrail']['rackspace']['api_key'] = ''
default['cookbook_testrail']['rackspace']['auth_region'] = 'uk'
default['cookbook_testrail']['rackspace']['endpoint'] = 'lon'
default['cookbook_testrail']['rackspace']['monitoring'] = true
default['cookbook_testrail']['rackspace']['backup'] = true
default['cookbook_testrail']['rackspace']['backup_container'] = ''

default['build-essential']['compile_time'] = true

