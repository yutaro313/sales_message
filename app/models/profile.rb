class Profile < ApplicationRecord
  belongs_to :sale

  attachment :profile_image

  # バリデーション
  validates :name, :birthplace, :hobby, :recent_event, :phone_number, :a_word, presence: true
end
