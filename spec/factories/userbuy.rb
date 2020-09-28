FactoryBot.define do
  factory :userbuy do
    token { 'tokentest' }
    post_code { '111-1111' }
    prefecture_id { '2' }
    city { 'しぶや' }
    block_number { '1-1-1' }
    phone_number { '09012345678' }
  end
end
