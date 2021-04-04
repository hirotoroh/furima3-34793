require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
     sleep 1
  end
  describe '商品購入機能' do
    context '購入できるとき' do
      it '全てが存在すれば購入できること' do
        expect(@order_address).to be_valid
      end

      it '建物名がなくても登録できること' do
        @order_address.build_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できないとき' do
      it 'postal_codeが空では登録できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeはハイフンが必要であること' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'Shipping_areaが空では登録できないこと' do
        @order_address.shipping_area_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area must be other than 0")
      end

      it 'Cityが空では登録できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'House_numberが空では登録できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'Phone_numberが空では登録できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'Phone_numberは半角数字のみでないと登録できないこと' do
        @order_address.phone_number = '11111aaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'Phone_numberは全角数字だと登録できないこと' do
        @order_address.phone_number = '１１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'Phone_numberは12桁以上だ登録できないこと' do
        @order_address.phone_number = '111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では登録できないこと" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では登録できないこと" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end