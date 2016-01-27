class AddPhotoToIndustryAndPosition < ActiveRecord::Migration
  def change
      add_attachment :positions, :photo
      add_attachment :industries, :photo
  end
end
