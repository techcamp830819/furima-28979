class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handringtime

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_fee
    validates :prefecture_id
    validates :handringtime_id
    validates :price
  end
end
