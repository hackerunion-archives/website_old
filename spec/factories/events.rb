# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title 'I am a little teapot'
    description 'Short and stout and stuff'
    starts DateTime.now
    ends DateTime.tomorrow
    approved false
    member_id 1
  end
end
