FactoryBot.define do
  factory :notification do
    task_id { Faker::Number.number(digits: 1) }
    user_id { Faker::Number.number(digits: 1) }
    details { Faker::Lorem.sentence }
  end
end
