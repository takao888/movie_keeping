require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントする' do
    context '上手くいく' do
      it '正常にコメントできる' do
        expect(@comment).to be_valid
      end
    end

    context '上手くいかない' do
      it 'commentが空の時' do
        @comment.comment = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment can't be blank")
      end
    end

  end

end
