#
# Cookbook Name:: newrelic_npi
# Recipe:: default
#
# Copyright (c) 2015 Jakob Hilden

directory node['newrelic_npi']['install_path'] do
  owner node['newrelic_npi']['user']
  recursive true # create parent directories if necessary
  action :create
end


unless ::File.exist?("#{node['newrelic_npi']['install_path']}/npi")

  # Download and Extract the NPI tool

  download_url = "https://download.newrelic.com/npi/v#{node['newrelic_npi']['version']}/platform_installer-#{node['newrelic_npi']['platform']}-#{node['newrelic_npi']['arch']}-v#{node['newrelic_npi']['version']}.tar.gz"

  execute 'download' do
    cwd node['newrelic_npi']['install_path']
    user node['newrelic_npi']['user']
    command "curl #{download_url} | tar xzf - --strip-components=1 -C '#{node['newrelic_npi']['install_path']}'"
  end

end


# Set Default Configurations for NPI

['user', 'license_key', 'distro'].each do |attribute|
  execute 'configure' do
    cwd node['newrelic_npi']['install_path']
    user node['newrelic_npi']['user']
    command "./npi set #{attribute} #{node['newrelic_npi'][attribute]}"
  end
end
