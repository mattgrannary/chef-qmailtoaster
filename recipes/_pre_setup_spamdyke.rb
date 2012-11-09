#
# Cookbook Name:: qmailtoaster
# Recipe:: _pre_setup_spamdyke
#
# Copyright 2012, Sebastian Grewe
#
# All rights reserved - Do Not Redistribute
#

# Define our qmail service for notifier
service "qmail" do
  supports [ :start, :restart ]
  action :nothing
end

# Install dependency
include_recipe "build-essential"

# Create directories manually prior to compile/install
directory node["spamdyke"]["source"]["directory"]
directory node["spamdyke"]["base_dir"]
directory node["spamdyke"]["bin_dir"]
directory node["spamdyke"]["conf_dir"]
directory node["spamdyke"]["var_dir"]
directory node["spamdyke"]["graylist_dir"] do
  mode "750"
  user node["spamdyke"]["vpopmail"]["user"]
  group node["spamdyke"]["vpopmail"]["group"]
end

# Link directories into FHS
link node["spamdyke"]["conf_link"] do
  to node["spamdyke"]["conf_dir"]
end
link node["spamdyke"]["var_link"] do
  to node["spamdyke"]["var_dir"]
end