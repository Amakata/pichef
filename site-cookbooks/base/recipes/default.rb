#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2013, Yoshihisa AMAKATA<amakata@gmail.com>
#
# All rights reserved - Do Not Redistribute
#


# 開発ツール関連
%w{screen vim emacs}.each do |pkg|
 package pkg do
  action :install
 end
end

directory "/home/pi/.emacs.d" do
 owner 'pi'
 group 'pi'
 mode '0775'
 action :create
end

%w{home/pi/.screenrc home/pi/.emacs.d/init.el}.each do |f|
 cookbook_file "/"+f do
  mode "0644"
  owner "pi"
  group "pi"
  source f
 end
end

directory "/root/.emacs.d" do
 owner 'root'
 group 'root'
 mode '0775'
 action :create
end

# opencv 関連
%w{python-opencv python-scipy python-numpy python-pip python-pygame}.each do |pkg|
 package pkg do
  action :install
 end
end

