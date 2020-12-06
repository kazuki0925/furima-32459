require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    describe 'ユーザー新規登録' do
      context '商品出品がうまくいくとき' do
        it '入力画面全ての項目が存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it 'imageが空だと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'nameが空では登録できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'infoが空では登録できない' do
          @item.info = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Info can't be blank")
        end
        it 'categoryが未選択では登録できない' do
          @item.category_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Category Select")
        end
        it 'sales_statusが未選択では登録できない' do
          @item.sales_status_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Sales status Select")
        end
        it 'shopping_fee_statusが未選択では登録できない' do
          @item.shopping_fee_status_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Shopping fee status Select")
        end
        it 'prefectureが未選択では登録できない' do
          @item.prefecture_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture Select")
        end
        it 'scheduled_deliveryが未選択では登録できない' do
          @item.scheduled_delivery_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery Select")
        end
        it 'priceが空では登録できない' do
          @item.price  = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが全角では登録できない' do
          @item.price  = '９９９９９'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Half-width number")
        end
        it 'priceが300未満では登録できない' do
          @item.price  = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it 'priceが9999999より大きい場合は登録できない' do
          @item.price  = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
      end
    end
  end
end
