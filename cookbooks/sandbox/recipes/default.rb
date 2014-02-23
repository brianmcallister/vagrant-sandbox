# Update apt.
execute 'apt-get update'

%w{build-essential ruby1.9.3}.each do |pkg|
  package pkg
end

directory '/var/lib/gems' do
  owner 'vagrant'
end

# Install the Berkshelf gem to manage recipes.
gem_package 'berkshelf' do
  gem_binary 'gem'
  version '3.0.0.beta7'
  action :install
end

execute 'berks install' do
  cwd '/vagrant'
  command 'berks install'
end