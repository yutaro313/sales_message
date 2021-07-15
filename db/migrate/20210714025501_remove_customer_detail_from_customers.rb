class RemoveCustomerDetailFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :customer_detail, :text
  end
end
