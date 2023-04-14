class RemoveColumnDaysToEventFrom < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :days_to_event
  end
end
