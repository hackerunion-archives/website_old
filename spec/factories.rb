require 'factory_girl'

FactoryGirl.define do

  factory :member do
    name 'Test User'
    sequence(:email) {|n| "user-#{n}@cyrusinnovation.com" }
    password 'password'
  end

  factory :skill do
    sequence(:name) { |n| "Juggling #{n} object(s)"}
  end
end
