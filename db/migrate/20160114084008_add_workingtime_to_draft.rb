class AddWorkingtimeToDraft < ActiveRecord::Migration
  def change
  	add_column :drafts,:working_time,:integer
  end
end
