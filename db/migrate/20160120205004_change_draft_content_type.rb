class ChangeDraftContentType < ActiveRecord::Migration
  def change
    change_column :drafts, :content, :text
  end
end
