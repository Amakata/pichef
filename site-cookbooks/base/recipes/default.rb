#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2013, Yoshihisa AMAKATA<amakata@gmail.com>
#
# All rights reserved - Do Not Redistribute
#

# 無線LAN設定

template "/etc/network/interfaces" do
 mode "0644"
 user "root"
 group "root"
 source "interfaces"
end

template "/etc/wpa_supplicant/wpa_supplicant.conf" do
 mode "0600"
 user "root"
 group "root"
 source "wpa_supplicant.conf"
end

# opencv 関連
%w{python-opencv python-scipy python-numpy python-pip python-pygame}.each do |pkg|
 package pkg do
  action :install
 end
end

bash "pip" do
 code <<-EOC
    sudo pip install --upgrade pip
    sudo pip install https://github.com/ingenuitas/SimpleCV/zipball/master
 EOC
end

# video4linux関連
%w{v4l-utils}.each do |pkg|
 package pkg do
  action :install
 end
end

