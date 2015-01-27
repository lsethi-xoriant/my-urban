class AddCategoryIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :category_id, :int
  end
end
