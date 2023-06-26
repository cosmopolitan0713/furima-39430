FactoryBot.define do
  factory :item do
    name               { Faker::Lorem.sentence }
    description        { Faker::Lorem.paragraph }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id        { 2 }
    condition_id       { 2 }
    shipping_charge_id { 2 }
    shipping_date_id   { 2 }
    prefecture_id      { 2 } 
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_sample.png'), filename: 'test_sample.png')
    end
  end
end