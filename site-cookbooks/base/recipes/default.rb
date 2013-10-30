#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2013, Yoshihisa AMAKATA<amakata@gmail.com>
#
# All rights reserved - Do Not Redistribute
#


# 開発ツール関連
%w{git screen vim emacs}.each do |pkg|
 package pkg do
  action :install
 end
end

%w{/home/pi/.emacs.d /home/pi/.emacs.d/elisp}.each do |d|
 directory d do
  owner 'pi'
  group 'pi'
  mode '0775'
  action :create
 end
end

%w{home/pi/.screenrc home/pi/.emacs.d/init.el home/pi/.emacs.d/elisp/inf-ruby.el home/pi/.emacs.d/elisp/js2-mode.el home/pi/.emacs.d/elisp/js2-mode.elc home/pi/.emacs.d/elisp/rdoc-mode.el home/pi/.emacs.d/elisp/ruby-additional.el home/pi/.emacs.d/elisp/ruby-electric.el home/pi/.emacs.d/elisp/ruby-mode.el home/pi/.emacs.d/elisp/ruby-style.el home/pi/.emacs.d/elisp/rubydb2x.el home/pi/.emacs.d/elisp/rubydb3x.el}.each do |f|
 cookbook_file "/"+f do
  mode "0644"
  owner "pi"
  group "pi"
  source f
 end
end

%w{/root/.emacs.d /root/.emacs.d/elisp}.each do |d|
 directory d do
  owner 'root'
  group 'root'
  mode '0775'
  action :create
 end
end

%w{root/.screenrc root/.emacs.d/init.el root/.emacs.d/elisp/inf-ruby.el root/.emacs.d/elisp/js2-mode.el root/.emacs.d/elisp/js2-mode.elc root/.emacs.d/elisp/rdoc-mode.el root/.emacs.d/elisp/ruby-additional.el root/.emacs.d/elisp/ruby-electric.el root/.emacs.d/elisp/ruby-mode.el root/.emacs.d/elisp/ruby-style.el root/.emacs.d/elisp/rubydb2x.el root/.emacs.d/elisp/rubydb3x.el}.each do |f|
 cookbook_file "/"+f do
  mode "0644"
  owner "root"
  group "root"
  source f
 end
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

