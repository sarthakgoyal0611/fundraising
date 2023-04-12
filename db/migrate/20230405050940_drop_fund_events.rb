class DropFundEvents < ActiveRecord::Migration[7.0]
  def change
    drop_table :fund_events
  end
end
