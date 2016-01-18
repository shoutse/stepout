class AddDescriptionToTopic < ActiveRecord::Migration
  def change
  	add_column :topics,:description,:string
  	change_column :topics,:content,:text
  	change_column :comments,:content,:text
  end
end
