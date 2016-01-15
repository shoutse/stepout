class AddColumnDrafts < ActiveRecord::Migration
  def change
    add_column :drafts, :duration, :integer
    change_column :topics, :duration, :integer
  end
end
