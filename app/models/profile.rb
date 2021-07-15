class Profile < ApplicationRecord
  belongs_to :sale

  attachment :profile_image
end
