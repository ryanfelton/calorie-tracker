class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :meals

  validates :email, presence: true, uniqueness: true

  # Typically I would do this via roles; however, given the simpliest of the
  # current scope, I've overriden the getter assocation
  def meals
    admin ? Meal.all : super
  end

  def admin?
    admin == true
  end

end
