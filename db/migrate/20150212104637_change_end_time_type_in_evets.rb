class ChangeEndTimeTypeInEvets < ActiveRecord::Migration
  def change
  	change_column :events, :endTime, :time
  end
end
