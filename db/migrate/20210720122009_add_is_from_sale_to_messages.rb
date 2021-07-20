class AddIsFromSaleToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :is_from_sale, :boolean
  end
end
