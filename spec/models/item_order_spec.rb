require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @item_order = FactoryBot.build(:item_order, item_id: @item.id, user_id: @user.id)
      sleep(0.1)
    end

      it '全ての項目が入力されていれば購入ができる' do
        expect(@item_order).to be_valid 
      end
      it 'token(クレジットカード情報)が空だと購入ができない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入ができない' do
        @item_order.postal_code = ""
        @item_order.valid?
        expect(@item_order.errors.messages).to include({:postal_code => ["can't be blank", "is invalid. Include hyphen(-)"]})
      end
      it '郵便番号にハイフンがないと登録できない' do
        @item_order.postal_code = "12345678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が8桁でないと購入できない' do
        @item_order.postal_code = "123-458"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空だと購入できない' do
        @item_order.prefecture_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @item_order.city = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと購入できない' do
        @item_order.street = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Street can't be blank")
      end
      it 'phoneが空だと購入できない' do
        @item_order.phone = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone can't be blank", "Phone is invalid")
      end
      it 'phoneが11桁でなければ購入できない' do
        @item_order.phone = "080123456789"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone is invalid")
      end
end
