

minecraft_jar = "#{Chef::Config['file_cache_path']}/#{node['minecraft']['jar']}"

user node['minecraft']['user'] do
  system true
  comment "Minecraft Server"
  home node['minecraft']['install_dir']
  shell "/bin/false"
  action :create
end

remote_file minecraft_jar do
  source "#{node['minecraft']['base_url']}/#{node['minecraft']['jar']}"
  checksum node['minecraft']['checksum']
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

execute "copy-minecraft_server.jar" do
  cwd node['minecraft']['install_dir']
  command "cp -p #{minecraft_jar} ."
  creates "#{node['minecraft']['install_dir']}/minecraft_server.jar"
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
  source "minecraft.init.erb"
  owner "root"
  group "root"
  mode 00755
end

service "minecraft" do
  supports :restart => true
  action [ :enable, :start ]
end
