FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user-#{n}@example.com" }
    password "password"

    factory :admin, class: User do
      admin true
    end
  end

end
