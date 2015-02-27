class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :en_name
      t.string :ua_name
      t.string :ru_name
      t.integer :state_id

      t.timestamps
    end
  end
end
