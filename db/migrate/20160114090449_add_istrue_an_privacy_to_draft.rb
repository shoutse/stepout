class AddIstrueAnPrivacyToDraft < ActiveRecord::Migration
  def change
  	add_column :drafts,:privacy,:boolean
  	add_column :drafts,:istrue,:boolean
  end
end
