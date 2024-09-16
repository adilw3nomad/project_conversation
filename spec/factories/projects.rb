FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    status { "Not Started" }
  end
end
