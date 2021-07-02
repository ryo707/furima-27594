require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @item_order = FactoryBot.build(:item_order, item_id: @item.id, user_id: @user.id)
      sleep(0.1)
    end

    
    describe '購入処理' do
      context '商品が購入できる時' do
        it '全ての項目が入力されていれば購入ができる' do
          expect(@item_order).to be_valid         
      end
        it '建物名がなくても登録できる時' do
          @item_order.building = ""
          expect(@item_order).to be_valid
        end
      end
      context '商品が購入できない時' do
        it 'token(クレジットカード情報)が空だと購入ができない' do
          @item_order.token = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("Token can't be blank")
        end
        it 'user_idが空では購入できない' do
          @item_order.user_id = ''
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空では購入できない' do
          @item_order.item_id = ''
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("Item can't be blank")
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
        it 'prefecture_idが1の場合登録できない' do
          @item_order.prefecture_id = 1
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("Prefecture must be other than 1")
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
        it 'phoneが10桁~11桁でなければ購入できない' do
          @item_order.phone = "0801234567"
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include()
        end
        it 'phoneが12桁以上では購入できない' do
          @item_order.phone = "111111111111"
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("Phone is invalid")
        end
        it 'phoneが半角数字のみでないと登録できない' do
          @item_order.phone = '09012345678'
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include()
        end
        it '電話番号は半角数字以外の文字があると保存できない' do
          @item_order.phone = 'a0901234567'
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include('Phone is invalid')
        end
      end
    end
  end
