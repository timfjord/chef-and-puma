action :add do
  execute "add_#{new_resource.path}_puma_app" do
    cmd = "sudo /etc/init.d/puma add #{new_resource.path} #{new_resource.user}"
    cmd << " #{new_resource.config}" if new_resource.config
    cmd << " #{new_resource.log}" if new_resource.log
    command cmd
  end
end

action :remove do
  execute "remove_#{new_resource.path}_puma_app" do
    command "sudo /etc/init.d/puma remove #{new_resource.path}"
  end
end