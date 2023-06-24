require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '発送先情報の保存' do
    before do
      order = FactoryBot.create(:order_address)
      @order_address = FactoryBot.build(:order_address, order_id: order.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
      it 'buildingは空でも保存できること' do
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'prefectureを選択していないと保存できないこと' do
      end
      it 'cityが空だと保存できないこと' do
      end
      it 'addressesが空だと保存できないこと' do
      end
      it 'phone_numberが空だと保存できないこと' do
      end
      it 'phone_numberが10桁以上11桁以内の半角数値のみでないと保存できないこと' do
      end
      it 'orderが紐付いていないと保存できないこと' do
      end
    end
  end
end
