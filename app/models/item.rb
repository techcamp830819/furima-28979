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
    validates :price, inclusion: { in: 300..9_999_999 }
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :handringtime_id
  end
    belongs_to :user
#     has_one :purchase
end
