class AddStatusToAvatars < ActiveRecord::Migration
  def change
    add_column :avatars, :status, :string
  end
end
