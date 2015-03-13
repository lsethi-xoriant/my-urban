class Google < ActiveRecord::Migration
  def change
    add_column :events, :street_number, :string
    add_column :events, :street_name, :string
    add_column :events, :city_name, :string
    add_column :events, :state, :string
    add_column :events, :zip_code, :string
    add_column :events, :country, :string
  end
end
