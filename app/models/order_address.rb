class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :house_number, :build_name, :phone_number, :order

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id
    validates :city
    validates :house_number, format: {with: /\A[0-9]+\z/}
    validates :phone_number, format: {with: /\A\d{11}\z/}
    validates :order_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, house_number: house_number, build_name: build_name, phone_number: phone_number, order_id: order.id)
  end
end