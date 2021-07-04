class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building, :phone, :item_id, :user_id, :token

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :street
    validates :token
    validates :user_id, :item_id
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    
  end
  

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone: phone, order_id: order.id)
  end
end
