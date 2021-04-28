FactoryBot.define do
  factory :user do

    transient do
      person { Gimei.name }
   end

    nickname{ Faker::Name.name }
    email{ Faker::Internet.free_email }
    password{ Faker::Internet.password(min_length: 6) }
    encrypted_password{ password }
    family_name{ person.last.kanji }
    first_name{ person.first.kanji }
    family_ruby{ person.last.katakana }
    first_ruby{ person.first.katakana }
    birthday{ date = Faker::Date.backward }

    
  end
end
