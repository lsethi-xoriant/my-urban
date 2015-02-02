class AddEventTypeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_type, :string
    add_column :events, :people_count, :string
  end
end
