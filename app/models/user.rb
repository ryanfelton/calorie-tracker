class User < ActiveRecord::Base
  after_create :create_initial_api_key
  has_secure_password

  has_many :api_keys
  has_many :meals

  validates :email, presence: true, uniqueness: true
  validates :expected_calories_per_day, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }

  # Typically I would do this via roles; however, given the simpliest of the
  # current scope, I've overriden the getter assocation
  def meals
    admin? ? Meal.all : super
  end


  private

  def create_initial_api_key
    api_keys.create if api_keys.blank?
  end
end
