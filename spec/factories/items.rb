FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    name {"車です"}
    description {"乗りやすいです"}
    category_id {1}
    status_id {1}
    shipping_cost_id {1}
    shipping_area_id {1}
    shipping_day_id {1}
    price {300}
    association :user
  end
end
