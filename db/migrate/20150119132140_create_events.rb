class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :adress
      t.string :description
      t.string :data
      t.string :timeStart
      t.string :endTime
      t.string :photo

      t.timestamps
    end
  end
end
