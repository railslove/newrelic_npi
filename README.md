# newrelic_npi

CHEF cookbook for installing/configuring the New Relic Platform Installer (NPI) and installing plugins with it.

### What is the New Relic Platform Installer (NPI)?

https://docs.newrelic.com/docs/plugins/plugins-new-relic/installing-plugins/installing-npi-compatible-plugin

The New Relic Platform Installer (NPI) is a command line utility that allows users to easily download, configure, and manage a plugin by installing it with a single command.

### Recipes

* `default` installs & configures NPI
* `install_plugins` runs default and install specified plugins

### Attributes

Required attributes:

* `['newrelic_npi']['user']` the unix user for installing/using NPI, it needs to have root privileges in order to create/start a background service for the plugin.
* `['newrelic_npi']['license_key']` New Relic license key (will reuse the attribute from the [newrelic](https://github.com/escapestudios-cookbooks/newrelic) cookbook if possible)

Optional attributes

* `['newrelic_npi']['version']` version of NPI to install (default: '0.1.5')
* `['newrelic_npi']['arch']` architecture ('x86' or 'x64') (default: 'x64')
* `['newrelic_npi']['platform']` platform (default: 'linux')
* `['newrelic_npi']['distro']` linux distribution (default: 'debian')
* `['newrelic_npi']['install_path']` path where NPI will be installed (default: "/home/youruser/newrelic-npi")
* `['newrelic_npi']['plugins']` New Relic plugins to install.  Expects a hash with plugin names as keys, e.g. `{ 'myplugin': ... }`
