gem_package 'puma'

cookbook_file '/etc/init.d/puma' do
  source 'puma'
  mode "0744"
end

service 'puma' do
  supports status: true, restart: true, stop: true, start: true, add: true, remove: true
  action :start
end

cookbook_file '/usr/local/bin/run_puma' do
  source 'run_puma'
  mode "0744"
end

