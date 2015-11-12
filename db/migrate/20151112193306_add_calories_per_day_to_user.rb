class AddCaloriesPerDayToUser < ActiveRecord::Migration
  def change
    add_column :users, :expected_calories_per_day, :integer, null: false, default: 0
  end
end
