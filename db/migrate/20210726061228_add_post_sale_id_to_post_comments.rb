class AddPostSaleIdToPostComments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :post_sale_id, :integer
  end
end
