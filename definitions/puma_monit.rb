define :puma_monit, path: nil, pidfile: nil, bundle_command: 'bundle',
                    config: nil, user: 'root', group: 'root' do
  raise('Path is required') unless params[:path]
  raise('Config is required') unless params[:config]
  raise('Pidfile is required') unless params[:pidfile]
  
  monit_monitrc params[:name] do
    template_source 'puma.monitrc.erb'
    template_cookbook 'puma'
    variables params
  end
  
end