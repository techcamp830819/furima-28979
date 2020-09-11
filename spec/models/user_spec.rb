require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
end

it "ニックネームが必須であること" do
  @user.nickname = nil
  @user.valid?
  expect(@user.errors.full_messages).to include("nickname can't be blank")
end

it "メールアドレスが必須であること" do
  @user.email = nil
  @user.valid?
  expect(@user.errors.full_messages).to include("email can't be blank")
end

it "メールアドレスが一意性であること" do
  @user.save
  another_user = FactoryBot.build(:user, email: @user.email)
  another_user.valid?
 expect(another_user.errors.full_messages).to include("Email has already been taken")
end

it "メールアドレスは@を含む必要があること" do
  expect(@user).to be_valid
end

it "パスワードが必須であること" do
  @user.encrypted_password = nil
  @user.valid?
  expect(@user.errors.full_messages).to include("encrypted_password can't be blank")
end

it "パスワードは6文字以上であること" do
  @user.encrypted_password = "123456"
  @user.encrypted_password_confirmation = "123456"
  expect(@user).to be_valid
end

it "パスワードは半角英数字混合であること" do

end

it "パスワードは確認用を含めて2回入力すること" do

end

it "ユーザー本名が、名字と名前がそれぞれ必須であること" do
  @user.last_name = nil
  @user.first_name = nil
  @user.valid?
  expect(@user.errors.full_messages).to include("last_name,first_name can't be blank")
end

it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do

end

it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること" do

end

it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do

end

it "生年月日が必須であること" do

    end
    
  end
end
