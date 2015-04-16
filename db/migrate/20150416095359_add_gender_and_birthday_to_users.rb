class AddGenderAndBirthdayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :datetime
    add_column :users, :gender, :string
  end
end
