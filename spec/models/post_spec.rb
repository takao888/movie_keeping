require 'rails_helper'
RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '情報を投稿する' do
    context '上手くいく' do
      it '全て正常に存在する' do
        expect(@post).to be_valid
      end
    end

    context '上手くいかない' do

      it 'titleが空の時' do
        @post.title = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end

      it 'contentが空の時' do
        @post.content = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Content can't be blank")
      end

      it 'imageが空の時' do
        @post.image = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end

    end

  end
end