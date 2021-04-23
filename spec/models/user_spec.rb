require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '上手くいく場合' do

      it "全て正常に存在する" do 
        expect(@user).to be_valid
      end

      it "nameが6文字以下" do
        @user.name = "abcdef"
        expect(@user).to be_valid
      end

      it "passwordが6文字以上" do
        @user.password = "abcdef"
        @user.password_confirmation ="abcdef"
        expect(@user).to be_valid
      end
    end

    context '上手くいかない場合' do
      it 'nameが空の時' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'emailが空の時' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空の時" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordあってもでもpassword_confirmationがない時" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "nameが7文字以上の時" do
        @user.name = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is too long (maximum is 6 characters)")
      end
      
      it "重複したemailの時" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      
      it "passwordが5文字以下の時" do
        @user.password = "abcde"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end


  end

end
