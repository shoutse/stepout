class AddUseridToTopic < ActiveRecord::Migration
  def change
  	add_column :topics,:user_id,:integer
  	add_column :drafts,:user_id,:integer
  	add_index :comments,:user_id
  	add_index :comments,:topic_id
  	add_index :topics,:user_id
  	add_index :topics,:position_id
  	add_index :topics,:industry_id
  	add_index :drafts,:position_id
  	add_index :drafts,:industry_id
  	add_index :drafts,:user_id
  	add_index :likes,:user_id
  	add_index :likes,:topic_id
  	add_index :subscriptions,:user_id
  	add_index :subscriptions,:topic_id
  end
end
