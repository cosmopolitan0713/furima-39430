FactoryBot.define do
  factory :order_address do
    order_id { 1 } 
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    addresses { '1-1' }
    building { '東京ハイツ' }
    phone_number{'08012345678'}
  end
end