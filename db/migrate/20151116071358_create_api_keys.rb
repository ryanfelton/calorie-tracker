class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.integer :user_id
      t.string :api_key, null: false
      t.timestamps
    end
  end
end
