class AddTurnNumberToEvent < ActiveRecord::Migration
  def change
    add_column :plans, :turn_number, :integer
  end
end
