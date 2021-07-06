class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :sale_id
      t.string :post_title
      t.string :post_image
      t.text :introduction

      t.timestamps
    end
  end
end
