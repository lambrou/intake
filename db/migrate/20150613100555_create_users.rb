class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :password_hash, :null => false
      t.string :lifestyle
      t.string :sex
      t.float :bmi, :default => 0
      t.integer :age, :default => 18
      t.float :bmr, :default => 0
      t.integer :weight, :default => 0
      t.integer :height, :default => 0
      t.integer :tweight, :default => 0
      t.integer :maxcal, :default => 0
      t.integer :calories, :default => 0
      t.integer :carbs, :default => 0
      t.integer :fat, :default => 0
      t.string :timezone
      t.timestamps
    end
    add_index :users, :email, :unique => true
  end
end
