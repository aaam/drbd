name              "drbd"
maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs/Configures drbd."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.8.0"
depends           "xfs"
depends           'yum', '~> 3.2'

%w{ debian ubuntu rhel centos scientific }.each do |os|
  supports os
end
