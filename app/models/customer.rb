class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :post_comments, foreign_key: :post_user_id, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :plans, foreign_key: :to_id, dependent: :destroy
  has_many :messages, foreign_key: :to_id, dependent: :destroy
  has_many :messages, foreign_key: :from_id, dependent: :destroy
end
