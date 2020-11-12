class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :day
  belongs_to_active_hash :ship
  belongs_to_active_hash :user
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :ship_id
    validates :prefecture_id
    validates :day_id
  end
  with_options presence: true do
    validates :name
    validates :description
  end
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, presence: true, format: {with: /\A[0-9]+\z/ }
  validates :user_id, presence: true
end