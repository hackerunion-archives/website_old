# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :announcement do
    title 'I am a little teapot'
    text 'Short and stout and stuff'
    created_at DateTime.now
    approved false
    member_id 1
  end
end
