class AddProfileImageIdToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :profile_image_id, :string
  end
end
