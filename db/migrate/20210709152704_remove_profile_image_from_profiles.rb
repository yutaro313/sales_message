class RemoveProfileImageFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :profile_image, :string
  end
end
