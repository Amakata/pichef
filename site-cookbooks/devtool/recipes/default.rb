#
# Cookbook Name:: devtool
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# 開発ツール関連
%w{git screen vim emacs}.each do |pkg|
 package pkg do
  action :install
 end
end

node[:devtool][:users].each do |user|
 %w{.emacs.d .emacs.d/elisp}.each do |d|
  directory user[:path] + "/" + d do
   owner user[:user]
   group user[:group]
   mode '0775'
   action :create
  end
 end

 %w{.screenrc .emacs.d/init.el .emacs.d/elisp/inf-ruby.el .emacs.d/elisp/js2-mode.el .emacs.d/elisp/js2-mode.elc .emacs.d/elisp/rdoc-mode.el .emacs.d/elisp/ruby-additional.el .emacs.d/elisp/ruby-electric.el .emacs.d/elisp/ruby-mode.el .emacs.d/elisp/ruby-style.el .emacs.d/elisp/rubydb2x.el .emacs.d/elisp/rubydb3x.el}.each do |f|
  cookbook_file user[:path] + "/" + f do
   mode "0644"
   owner user[:user]
   group user[:group]
   source f
  end
 end
end
