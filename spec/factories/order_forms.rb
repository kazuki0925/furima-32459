FactoryBot.define do
  factory :order_form do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { 'テスト市' }
    house_number { 'テスト町 0-0-00' }
    building { 'テストビル' }
    phone_number { '09000000000' }
  end
end
