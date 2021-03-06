class Userbuy
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :block_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :city
    validates :token
  end

  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :block_number, presence: true
  validates :phone_number, presence: true, length: { maximum: 11 } 

  def save
    order = Order.create!(item_id: item_id, user_id: user_id)
    Address.create!(post_code: post_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
