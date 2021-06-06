class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day
  

  with_options presence: true do
    validates :name, :description, :image
  
    with_options numericality: { other_than: 1 } do
      validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :delivery_day_id
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than: 299, less_than: 10000000 } 
    end
  end
end
