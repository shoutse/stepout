class Draft < ActiveRecord::Base
	belongs_to :user
	belongs_to :industry
	belongs_to :position

  validates_presence_of :name, :position_id, :industry_id, :content, :duration
end
