class AddPhotographToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :photograph, :string
  end
end
