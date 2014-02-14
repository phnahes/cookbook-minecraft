#
# Cookbook Name:: minecraft
# Recipe:: default
#
#
include_recipe "minecraft::install"

if node[:minecraft][:use_bukkit]
	node.set['minecraft']['jar'] = node['minecraft']['bukkit_jar']
	include_recipe "minecraft::bukkit"
else
	node.set['minecraft']['jar'] = node['minecraft']['vanilla_jar']
	include_recipe "minecraft::vanilla"
end
