class Post < ApplicationRecord


  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  belongs_to :customer, optional: true
  # optionalはnilでも有効にする
  belongs_to :sale

  attachment :post_image

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  validates :post_title, :introduction, presence: true

end
