FactoryBot.define do
  factory :notification do
    task_id { 1 }
    user_id { 1 }
    details { "MyText" }
  end
end
