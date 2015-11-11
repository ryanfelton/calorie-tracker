FactoryGirl.define do
  factory :meal do
    user
    sequence :name do |n|
      "Meal ##{n}"
    end
    number_of_calories { Random.rand(500) }
    consumed_at { Time.now }
  end

end
