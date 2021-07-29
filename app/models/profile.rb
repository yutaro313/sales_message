class Profile < ApplicationRecord
  belongs_to :sale

  attachment :profile_image, content_type: ["profile_image/jpeg", "profile_image/png"]

  # バリデーション
  validates :name, :birthplace, :hobby, :recent_event, :phone_number, :a_word, presence: true
end
