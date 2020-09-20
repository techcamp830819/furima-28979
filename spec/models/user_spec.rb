require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it '全ての値が存在すれば登録できる' do
          expect(@user).to be_valid
        end

        it 'パスワードは6文字以上であること' do
          @user.password = 'aaa1111'
          @user.password_confirmation = 'aaa1111'
          expect(@user).to be_valid
        end

        it 'パスワードは半角英数字混合であること' do
          @user.password = 'aaa1111'
          @user.password_confirmation = 'aaa1111'
          expect(@user).to be_valid
        end
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'ニックネームが必須であること' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが必須であること' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは@を含む必要があること' do
        @user.email = 'aaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須であること' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'ユーザー本名が、名字と名前がそれぞれ必須であること' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）を入力')
      end

      it 'ユーザー本名が、名字と名前がそれぞれ必須であること' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）を入力')
      end

      it 'ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角（カタカナ）を入力')
      end

      it 'ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角（カタカナ）を入力')
      end

      it '生年月日が必須であること' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
