class AddColumnRaisedAmountToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :raised_amount, :integer
  end
end
