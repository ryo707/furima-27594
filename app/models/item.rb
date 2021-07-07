class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :delivery_day_id
    end
    validates :price, numericality: { only_integer: true }, inclusion: { in: 300..9_999_999, message: 'は300〜9,999,999の範囲内で入力してください' }
  end

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :delivery_day
  has_one_attached :image
  has_one :order, dependent: :destroy
end