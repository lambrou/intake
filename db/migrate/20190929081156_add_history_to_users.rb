class AddHistoryToUsers < ActiveRecord::Migration[6.0]
  def change
  	change_table :users do |t|
	    t.string :calorieHistory
	    t.string :weightHistory
	    t.string :timestampHistory
	    t.integer :dayCount, :default => 0
	end
  end
end
