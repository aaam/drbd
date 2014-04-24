#
# Author:: Matt Ray <matt@opscode.com>
# Cookbook Name:: drbd
# Recipe:: default
#
# Copyright 2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#prime the search to avoid 2 masters
node.save unless Chef::Config[:solo]

case node.platform_family
when 'debian'
  package "drbd8-utils" do
    action :install
  end
when 'rhel'
  yum_repository "atrpms" do
    description "ATrpms third-party repo"
    baseurl "http://dl.atrpms.net/el$releasever-$basearch/atrpms/stable"
    gpgkey "http://packages.atrpms.net/RPM-GPG-KEY.atrpms"
    action :add
  end

  yum_package 'drbd' do
    action :install
  end

  yum_package "drbd-kmdl-#{`uname -r`.strip}" do
    action :install
  end
end

service "drbd" do
  supports(
    :restart => true,
    :status => true
  )
  action :nothing
end
