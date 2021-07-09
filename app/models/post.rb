class Post < ApplicationRecord


  has_many :favorite, dependent: :destroy
  has_many :post_comment, dependent: :destroy

  belongs_to :sale

  attachment :post_image
end
