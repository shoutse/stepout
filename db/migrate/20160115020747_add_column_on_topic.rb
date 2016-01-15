class AddColumnOnTopic < ActiveRecord::Migration
  def change
    add_column :topics, :duration, :integer
  end
end
