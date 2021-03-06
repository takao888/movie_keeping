class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :content
    validates :title
    validates :image
  end

end
