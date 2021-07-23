class AddActionToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :action, :integer
  end
end
