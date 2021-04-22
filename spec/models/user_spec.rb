require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      user = User.new(name:"", email:"p@p", password:"ppp000")
      user.valid?
    end

    it 'emailが空では登録できない' do
    end


  end

end
