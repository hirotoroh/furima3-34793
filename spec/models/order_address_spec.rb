require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    # sleep 1
  end
  describe '商品購入機能' do
    context '購入できるとき' do
      it '全てが存在すれば購入できること' do
        expect(@order_address).to be_valid
      end
    end
  end
end