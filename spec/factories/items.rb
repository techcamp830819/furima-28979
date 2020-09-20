FactoryBot.define do
  factory :item do
    name { '商品' }
    description { '商品説明' }
    category_id { 2 }
    condition_id { 2 }
    delivery_fee_id { 2 }
    prefecture_id { 2 }
    handringtime_id { 2 }
    price { 1000 }
  end
end
