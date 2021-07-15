class AddActionToPostComments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :action, :integer
  end
end
