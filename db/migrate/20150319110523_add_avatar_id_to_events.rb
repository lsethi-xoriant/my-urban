class AddAvatarIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :avatar_id, :integer
  end
end
