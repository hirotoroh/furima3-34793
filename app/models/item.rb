class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :shipping_day
  has_one_attached :image

  varidates :name, :description, presence: true

  validates :category, numericality: { other_than: 1 } 
  validates :status, numericality: { other_than: 1 } 
  validates :shipping_cost, numericality: { other_than: 1 } 
  validates :shipping_area, numericality: { other_than: 1 } 
  validates :shipping_day, numericality: { other_than: 1 } 
end
