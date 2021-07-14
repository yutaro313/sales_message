class AddCustomerDetailToCustomerDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :customer_detail, :string, default: "未入力"
  end
end
