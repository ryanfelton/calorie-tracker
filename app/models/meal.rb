class Meal < ActiveRecord::Base

  belongs_to :user

  validates :user_id, :name, :number_of_calories, :consumed_at, presence: true
  validates :number_of_calories, numericality: { only_integer: true,  greater_than: 0 }

end
