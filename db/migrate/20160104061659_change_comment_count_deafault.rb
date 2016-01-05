class ChangeCommentCountDeafault < ActiveRecord::Migration
  def change
  	change_column :topics,:comment_count,:integer,:default=>0
  end
end
