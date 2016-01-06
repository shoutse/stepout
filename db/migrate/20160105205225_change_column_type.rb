class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :comments, :content, :text
    change_column :drafts, :content, :text
    change_column :comments, :content, :text
    change_column :topics, :content, :text
  end
end
