include_recipe 'newrelic_npi::default'

# Install plugins

node['newrelic_npi']['plugins'].keys.each do |plugin|

  execute 'fetch' do
    cwd node['newrelic_npi']['install_path']
    user node['newrelic_npi']['user']
    command "./npi fetch #{plugin} -y"
    not_if do
      ::File.exist? "#{node['newrelic_npi']['install_path']}/plugins/#{plugin}"
    end
  end

  execute 'prepare' do
    cwd node['newrelic_npi']['install_path']
    user node['newrelic_npi']['user']
    command "./npi prepare #{plugin}"
  end

  execute 'add-service' do
    cwd node['newrelic_npi']['install_path']
    user node['newrelic_npi']['user']
    command "sudo ./npi add-service #{plugin} --start" # needs root privileges
    not_if do
      ::File.exist? "/etc/init.d/newrelic_plugin_#{plugin}"
    end
  end

end