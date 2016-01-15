class ResetAttributeOnTopic < ActiveRecord::Migration
  def change
    remove_column :topics, :duration
  end
end
