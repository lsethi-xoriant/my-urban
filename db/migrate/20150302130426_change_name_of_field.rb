class ChangeNameOfField < ActiveRecord::Migration
  def change
    rename_column :users, :city, :urban
  end
end
