# Note - it may be worth bringing all these out into separate files
# in the spec/factories directory, if this file becomes unwieldy.
# Format would be: only one factory per "FactoryGirl.define" block

FactoryGirl.define do

  factory :member do
    name 'Test User'
    sequence(:email) {|n| "user-#{n}@cyrusinnovation.com" }
    password 'password'
  end

  factory :skill do
    sequence(:name) { |n| "Juggling #{n} object(s)"}
  end

  factory :affiliation do
    sequence(:name) { |n| "Cyrus#{n}" }
  end
end
