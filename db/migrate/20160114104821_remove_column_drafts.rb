class RemoveColumnDrafts < ActiveRecord::Migration
  def change
    remove_column :drafts, :duration
  end
end
