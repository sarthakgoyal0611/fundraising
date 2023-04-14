class AddColumnActiveDaysToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :days_to_event, :integer
  end
end
