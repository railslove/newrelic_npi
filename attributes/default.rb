default['newrelic_npi']['version'] = '0.1.5'
default['newrelic_npi']['arch'] = 'x64'
default['newrelic_npi']['platform'] = 'linux'
default['newrelic_npi']['distro'] = 'debian'
default['newrelic_npi']['user'] = ''
default['newrelic_npi']['install_path'] = "/home/#{node['newrelic_npi']['user']}/newrelic-npi"
default['newrelic_npi']['license_key'] = node['newrelic']['server_monitoring']['license'] || ''
default['newrelic_npi']['plugins'] = {}