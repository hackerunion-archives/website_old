# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    description "MyString"
    start_time "2012-04-17 13:44:47"
    end_time "2012-04-17 13:44:47"
    approved ""
    member_id 1
  end
end
