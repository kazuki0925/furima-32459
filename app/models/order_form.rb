class OrderForm

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :order_id
  
# ここにバリデーションの処理を書く
with_options presence: true do
  # validates :token
  validates :postal_code , format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
  validates :city
  validates :house_number
  validates :phone_number, numericality: { only_integer: true, message: 'Input only number' }
end

validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end