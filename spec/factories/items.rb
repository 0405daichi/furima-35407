FactoryBot.define do
  factory :item do
    item_name { Faker::Name.initials(number: 2) }
    item_description { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    item_price { 10_000 }
    burden_id { 2 }
    source_id { 2 }
    guideline_id { 2 }
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
    association :user
  end
end
