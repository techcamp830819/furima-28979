class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id
  belongs_to_active_hash :condition_id
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture_id
  belongs_to_active_hash :handringtime_id

  has_one_attached :image
end