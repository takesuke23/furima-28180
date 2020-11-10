class Item < ApplicationRecord
  with_options precense: true do
    validates :name
    validates :description
    validates :category_id
    validates :ship_id
    validates :pre_id
    validates :days_id
    validates :price
  end
  validates :user_id, precense: true, foreign_key: true
  belongs_to :user
  has_one_attached :image
end