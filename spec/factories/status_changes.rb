FactoryBot.define do
  factory :status_change do
    new_status { "In Progress" }
    association :user
    association :project
  end
end
