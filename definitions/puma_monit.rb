define :puma_monit, path: nil, pidfile: nil, bundle_command: 'bundle',
                    config: nil, user: 'root', group: 'root', init_file: nil do
  raise('Path is required') unless params[:path]
  raise('Config is required') unless params[:config]
  raise('Pidfile is required') unless params[:pidfile]
  
  init_command = if params[:init_file]
    "test -f #{params[:init_file]} && source #{params[:init_file]} ; "
  else
    ''
  end
  vars = params.merge({
    init_command: init_command
  })
  
  monit_monitrc params[:name] do
    template_source 'puma.monitrc.erb'
    template_cookbook 'puma'
    variables vars
  end
  
end