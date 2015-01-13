name             'cookbook_testrail'
maintainer       'Fred Thompson'
maintainer_email 'fred.thompson@buildempire.co.uk'
license          'Apache 2.0'
description      'The TestRail cookbook, a fresh TestRail deployment'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

recipe 'cookbook_testrail', 'The TestRail cookbook, a fresh TestRail deployment.'

%w{ ubuntu }.each do |os|
  supports os
end

%w{apt build-essential appbox database git htpasswd magic_shell newrelic nginx php php-fpm rackspace_cloudbackup rackspace_cloudmonitoring xml}.each do |cb|
  depends cb
end