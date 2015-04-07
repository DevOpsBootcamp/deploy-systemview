#
# Cookbook Name:: deploy-systemview
# Recipe:: default
#
# Copyright (C) 2015 OSU Open Source Lab
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Include the chef resources we will be using.
# We will use the git resource to clone the cookbook.
# We will use the pip resource to install python dependencies.
# we will use the virtualenv resource to keep all of our python dependencies
# in one place.
include_recipe 'git'
include_recipe 'python::pip'
include_recipe 'python::virtualenv'
include_recipe 'supervisor'
include_recipe 'nginx'

# create the virtual environment for the application using the
# python_virtualenv resource.
python_virtualenv node['systemview']['virtualenv_path'] do
  action :create
end

# use the git resource to checkout or update the code from the webapp's
# git repo
# docs on the git resource can be found here:
# https://docs.chef.io/resource_git.html
git node['systemview']['app_path'] do
  repository node['systemview']['repository']
  revision node['systemview']['revision']
  action :sync
end

# install the python packages which systemview needs using the requirements.txt
# file. this is equivalent to pip install -r /opt/systemview/requirements.txt
python_pip "#{ node['systemview']['app_path'] }/requirements.txt" do
  action :install
  options '-r'
  virtualenv node['systemview']['virtualenv_path']
end
