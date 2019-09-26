# Rakefile
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require ::File.expand_path('../config/environment',  __FILE__)
  end
end