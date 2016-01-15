class AddColToDraft < ActiveRecord::Migration
  def change
    add_column :drafts, :duration, :integer, :default => 0
  end
end
