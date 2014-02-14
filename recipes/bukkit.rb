#
# Cookbook Name: Minecraft
# Recipe: bukkit
#

#minecraft_jar = "#{Chef::Config['file_cache_path']}/#{node['minecraft']['bukkit_jar']}"
minecraft_jar = "#{node['minecraft']['install_dir']}/#{node['minecraft']['bukkit_jar']}"

user node['minecraft']['user'] do
  system true
  comment "Minecraft Server"
  home node['minecraft']['install_dir']
  shell "/bin/false"
  action :create
  not_if "id #{node['minecraft']['user']}"
end

remote_file minecraft_jar do
  source "#{node['minecraft']['bukkit_url']}/#{node['minecraft']['bukkit_jar']}"
  owner node['minecraft']['user']
  group node['minecraft']['user']
  mode '0644'
  action :create_if_missing
end

directory node['minecraft']['install_dir'] do
  owner node['minecraft']['user']
  group node['minecraft']['user']
  mode '0755'
  action :create
  recursive true
end

%w[ops.txt server.properties banned-ips.txt banned-players.txt white-list.txt].each do |template|
  template "#{node['minecraft']['install_dir']}/#{template}" do
    source "#{template}.erb"
    owner node['minecraft']['user']
    group node['minecraft']['user']
    mode 0644
    action :create
  end
end

template "/etc/init.d/minecraft" do
  source "craftbukkit.init.erb"
  owner "root"
  group "root"
  mode 00755
end

template "/etc/default/minecraft" do
  source "craftbukkit.default.erb"
  owner "root"
  group "root"
  mode 00755
end

service "minecraft" do
  supports :restart => true
  action [ :enable, :start ]
end
