FactoryBot.define do
  factory :item do
    item_name {Faker::Name.initials(number: 2)}
    item_description {Faker::Lorem.sentence}
    category_id {2}
    status_id {2}
    item_price {10000}
    burden_id {2}
    source_id {2}
    guideline_id {2}
    association :user
  end
end
