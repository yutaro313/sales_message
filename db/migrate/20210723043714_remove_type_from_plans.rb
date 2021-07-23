class RemoveTypeFromPlans < ActiveRecord::Migration[5.2]
  def change
    remove_column :plans, :type, :integer
  end
end
