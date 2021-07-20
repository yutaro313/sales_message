class Sale < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :posts, dependent: :destroy
  has_many :post_comments, foreign_key: :post_user_id

  has_many :plans, foreign_key: :from_id, dependent: :destroy
  has_many :plans, foreign_key: :to_id, dependent: :destroy

  has_many :messages, foreign_key: :to_id, dependent: :destroy
  has_many :messages, foreign_key: :from_id, dependent: :destroy

  has_one :profile
  accepts_nested_attributes_for :profile


  attachment :profile_image

  def name
    Profile.find_by(sale_id: self.id).name
  end
end
