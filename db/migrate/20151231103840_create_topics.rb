class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :content
      t.integer :comment_count
      t.integer :position_id
      t.integer :industry_id
      t.timestamps null: false
    end
  end
end
