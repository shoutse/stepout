class AddColToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :duration, :integer, :default => 0
  end
end
