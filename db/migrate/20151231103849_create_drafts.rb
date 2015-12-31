class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.string :name
      t.string :content
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.integer :position_id
      t.integer :industry_id
      t.string :status
      t.timestamps null: false
    end
  end
end
