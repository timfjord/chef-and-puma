define :puma_config, owner: nil, group: nil, directory: nil, rackup: nil,
                     environment: 'production', daemonize: false, 
                     pidfile: nil, state_path: nil, stdout_redirect: '',
                     quiet: false, threads: '0, 16', bind: nil,
                     ssl_bind: nil, restart_command: nil, workers: nil,
                     activate_control_app: '' do
                       
  unless params[:pidfile]
    params[:pidfile] = ::File.join ::File.dirname(params[:name]), 'tmp', 'pids', 'puma.pid'
  end
  unless params[:state_path]
    params[:state_path] = ::File.join ::File.dirname(params[:name]), 'tmp', 'pids', 'puma.state'
  end
  
  directory ::File.dirname(params[:name]) do
    recursive true
    owner params[:owner] if params[:owner]
    group params[:group] if params[:group]
  end
  
  template params[:name] do
    source "puma.rb.erb"
    cookbook "puma"
    mode "0644"
    owner params[:owner] if params[:owner]
    group params[:group] if params[:group]
    variables params
  end

end
