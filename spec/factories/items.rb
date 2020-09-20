FactoryBot.define do
  factory :item do
    name { 'なまえ' }
    description { 'せつめい' }
    category_id { 1 }
    condition_id { 1 }
    delivery_fee_id { 1 }
    prefecture_id { 1 }
    handringtime_id { 1 }
    price { 1000 }
  end
end
