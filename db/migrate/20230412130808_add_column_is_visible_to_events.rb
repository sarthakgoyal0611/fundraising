class AddColumnIsVisibleToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :is_visible, :boolean, :default => false
  end
end
