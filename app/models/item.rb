class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :day
  belongs_to_active_hash :ship
  belongs_to_active_hash :user
  with_options precense: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :ship_id
    validates :prefecture_id
    validates :day_id
  end
  with_options precense: true do
    validates :name
    validates :description  
  end
  validates :price, precense: true, format: {with: /\A[0-9]{300,1000}+\z/}
  validates :user_id, precense: true, foreign_key: true
end