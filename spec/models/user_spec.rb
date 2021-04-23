require 'rails_helper'
describe User do
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
      it 'nameが空では登録できない' do
        @user.name
      end

      it 'emailが空では登録できない' do
      end

      it "passwordが空では登録できない" do
      end

      it "passwordとpassword_confirmationが空の時" do
      end

      it "passwordあってもでもpassword_confirmationがない時" do
      end

      it "nameが7文字以上の時" do
      end
      
      it "重複したemailの時" do
      end
      
      it "passwordが5文字以下の時" do
      end
      
      it "" do
      end
      
      it "" do
      end
      
      it "" do
      end
      
    end


  end

end
