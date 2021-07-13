class Post < ApplicationRecord


  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  belongs_to :sale

  attachment :post_image
end
