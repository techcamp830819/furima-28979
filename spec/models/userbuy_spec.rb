require 'rails_helper'

RSpec.describe Userbuy, type: :model do
  describe '#create' do
    before do
      @userbuy = FactoryBot.build(:userbuy)
    end

    describe '商品購入機能' do
      context '商品購入がうまくいくとき' do
        it '全ての値が存在すれば購入できる' do
          expect(@userbuy).to be_valid
        end
        it '郵便番号が7桁の場合は購入できること' do
          @userbuy.post_code = '111-1111'
          expect(@userbuy).to be_valid
        end

        it '郵便番号が半角数字である場合は購入できること' do
          @userbuy.post_code = '111-1111'
          expect(@userbuy).to be_valid
        end

        it '建物名がなくても購入できること' do
          @userbuy.building_name = ''
          expect(@userbuy).to be_valid
        end
      end
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号が必須であること' do
        @userbuy.post_code = nil
        @userbuy.valid?
        expect(@userbuy.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '郵便番号が7桁未満の場合は購入できないこと' do
        @userbuy.post_code = '123456'
        @userbuy.valid?
        expect(@userbuy.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '郵便番号が8桁以上の場合は購入できないこと' do
        @userbuy.post_code = '12345678'
        @userbuy.valid?
        expect(@userbuy.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '郵便番号が半角数字でない場合は購入できないこと' do
        @userbuy.post_code = '１２３４５６７'
        @userbuy.valid?
        expect(@userbuy.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '都道府県がない場合は購入できないこと' do
        @userbuy.prefecture_id = ''
        @userbuy.valid?
        expect(@userbuy.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end

      it '市区町村がない場合は登録できないこと' do
        @userbuy.city = ''
        @userbuy.valid?
        expect(@userbuy.errors.full_messages).to include("City can't be blank")
      end

      it '番地がない場合は登録できないこと' do
        @userbuy.block_number = ''
        @userbuy.valid?
        expect(@userbuy.errors.full_messages).to include("Block number can't be blank")
      end

      it '電話番号がない場合は購入できないこと' do
        @userbuy.phone_number = ''
        @userbuy.valid?
        expect(@userbuy.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
