FactoryBot.define do
  factory :user do
    nickname {'ふりま'}
    last_name {'とうきょう'}
    first_name {'たろう'}
    last_name_kana {'トウキョウ'}
    first_name_kana {'タロウ'}
    password {'aaa1111'}
    birth_date {19000101}
    email {'test@test'}
  end
end
