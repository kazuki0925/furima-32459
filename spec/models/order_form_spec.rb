require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe OrderForm do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    describe '商品購入機能' do
      context '商品購入がうまくいくとき' do
        it '入力画面全ての項目に正しく入力をすれば購入できる' do
          expect(@order_form).to be_valid
        end
        it 'buildingが空でも購入できる' do
          @order_form.building = nil
          expect(@order_form).to be_valid
        end
      end

      context '商品購入がうまくいかないとき' do
        it 'tokenが空では購入できない' do
          @order_form.token = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Token can't be blank")
        end
        it 'postal_codeが空では購入できない' do
          @order_form.postal_code = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeにハイフンが含まれていないと購入できない' do
          @order_form.postal_code = '1234567'
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
        end
        it 'postal_codeのハイフンの位置が適切でないと購入できない' do
          @order_form.postal_code = '12-34567'
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
        end
        it 'prefectureが未選択では購入できない' do
          @order_form.prefecture_id = 0
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include('Prefecture Select')
        end
        it 'cityが空では購入できない' do
          @order_form.city = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("City can't be blank")
        end
        it 'house_numberが空では購入できない' do
          @order_form.house_number = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("House number can't be blank")
        end
        it 'phone_numberが空では購入できない' do
          @order_form.phone_number = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが空では購入できない' do
          @order_form.phone_number = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberにハイフンをつけると購入できない' do
          @order_form.phone_number = '090-0000-0000'
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number Input only number")
        end
      end
    end
  end
end
