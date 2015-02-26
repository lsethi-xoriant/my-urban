class AddCityIdColumnToModels < ActiveRecord::Migration
  def change
    add_column :users, :city_id, :integer
    add_column :events, :city_id, :integer
  end
end
