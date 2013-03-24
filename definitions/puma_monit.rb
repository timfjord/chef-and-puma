define :puma_monit, path: nil, pidfile_path: nil, bundle_command: 'bundle',
                    config: nil, user: 'root', group: 'root' do
  raise('Path is required') unless params[:path]
  raise('Config is required') unless params[:config]
  params[:pidfile] = ::File.join(params[:path], 'tmp', 'puma', 'pid')
  
  monit_monitrc params[:name] do
    template_source 'puma.monitrc.erb'
    template_cookbook 'puma'
    variables params
  end
  
end