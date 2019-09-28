# Rakefile
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
namespace :db do
  task :load_config do
    require ::File.expand_path('../config/environment',  __FILE__)
  end
  task :daily_reset => :environment do
    require ::File.expand_path('../app/models/user',  __FILE__)
    User.all.each do |currentUser|
      currentUser.calories = 0
      currentUser.fat = 0
      currentUser.carbs = 0
      currentUser.save!
    end
  end
end