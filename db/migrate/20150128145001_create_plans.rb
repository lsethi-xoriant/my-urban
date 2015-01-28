class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :status
      t.integer :member_id, index: true
      t.integer :measure_id, index: true

      t.timestamps
    end
  end
end
