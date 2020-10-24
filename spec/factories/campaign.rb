FactoryBot.define do
  factory :campaign do
    name "Save the child"
    story "Sample story"
    goal "200000"
    association :user, factory: :user
    association :campaign_category, factory: :campaign_category
  end
end
