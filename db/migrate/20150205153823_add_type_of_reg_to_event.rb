class AddTypeOfRegToEvent < ActiveRecord::Migration
  def change
    add_column :events, :reg_type, :string
  end
end
