class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :shipping_day
  has_one_attached :image

  validates :name, :description, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/ }

  validates :category_id, numericality: { other_than: 0 } 
  validates :status_id, numericality: { other_than: 0 } 
  validates :shipping_cost_id, numericality: { other_than: 0 } 
  validates :shipping_area_id, numericality: { other_than: 0 } 
  validates :shipping_day_id, numericality: { other_than: 0 } 
end
