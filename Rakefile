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
      if !currentUser.calorieHistory || currentUser.dayCount == 7
        currentUser.calorieHistory = '["' + currentUser.calories.to_s + '"]'
        currentUser.weightHistory = '["' + currentUser.weight.to_s +  '"]'
        currentUser.timestampHistory = '["' + Time.now.strftime("%Y/%m/%d").to_s + '"]' 
        currentUser.dayCount = 1
      else
        if currentUser.calories > 0 && currentUser.weight > 0
          currentUser.calorieHistory = (currentUser.calorieHistory).delete_suffix('"]') + '","' + currentUser.calories.to_s + '"]'
          currentUser.weightHistory = (currentUser.weightHistory).delete_suffix('"]') + '","' + currentUser.weight.to_s + '"]'
          currentUser.timestampHistory = (currentUser.timestampHistory).delete_suffix('"]') + '","' + Time.now.strftime("%Y/%m/%d").to_s + '"]'
          currentUser.dayCount += 1
        end

      end
      currentUser.calories = 0
      currentUser.fat = 0
      currentUser.carbs = 0
      currentUser.save!
    end
  end
end