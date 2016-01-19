class AddIntruductionToUser < ActiveRecord::Migration
  def change
  	add_column :users,:introduction,:text
  end
end
