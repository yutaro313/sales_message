class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.integer :from_id
      t.integer :to_id
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      
      t.timestamps
    end
  end
end
