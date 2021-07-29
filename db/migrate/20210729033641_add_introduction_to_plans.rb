class AddIntroductionToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :introduction, :string
  end
end
