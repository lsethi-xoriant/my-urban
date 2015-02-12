class ChangeTimeStartTypeInEvets < ActiveRecord::Migration
  def change
  	change_column :events, :timeStart, :time
  end
end
