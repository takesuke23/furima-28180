class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :prefercture
  belongs_to :category
  belongs_to :condition
  belongs_to :day
  belongs_to :ship
  belongs_to :user
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
  validates :price, precense: true, format: {with: /\A[0-9]{300,9999999}+\z/}
  validates :user_id, precense: true, foreign_key: true
end