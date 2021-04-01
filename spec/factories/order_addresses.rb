FactoryBot.define do
  factory :order_address do
    postal_code {'123-4567'}
    shipping_area_id {1}
    city {'東京都'}
    house_number {'1-1'}
    build_name {'東京ハイツ'}
    phone_number {'09000000000'}
  end
end
