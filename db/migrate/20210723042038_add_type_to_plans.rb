class AddTypeToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :type, :integer
  end
end
