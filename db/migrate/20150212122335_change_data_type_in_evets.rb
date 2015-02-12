class ChangeDataTypeInEvets < ActiveRecord::Migration
  def change
  	change_column :events, :data, :datetime
  end
end
