class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.references :user, index: true, foreign_key: true
      t.text :name, null: false
      t.integer :number_of_calories, null: false
      t.datetime :consumed_at, null: false

      t.timestamps null: false
    end
  end
end
