class AddWorkingTimeToTopic < ActiveRecord::Migration
  def change
  	add_column :topics,:working_time,:integer  	
  end
end
