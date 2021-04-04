class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name, :description, :image, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/ }

  with_options numericality: { other_than: 0 } do
    validates :category_id 
    validates :status_id
    validates :shipping_cost_id 
    validates :shipping_area_id 
    validates :shipping_day_id 
  end
end
