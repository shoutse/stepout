class AddColumnToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :years, :integer
  end
end
