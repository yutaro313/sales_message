class Sale < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :post, dependent: :destroy
  has_many :post_comment, dependent: :destroy

  has_one :profile
  accepts_nested_attributes_for :profile


  attachment :profile_image
end
