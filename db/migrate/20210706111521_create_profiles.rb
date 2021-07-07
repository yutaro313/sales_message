class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :sale_id
      t.string :profile_image
      t.string :name
      t.string :birthplace
      t.string :hobby
      t.string :recent_event
      t.text :a_word
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
