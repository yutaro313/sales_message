class RemoveAttributeFromPostComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_comments, :attribute, :integer
  end
end
