class AddBackgroundIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :background_id, :integer
  end
end
