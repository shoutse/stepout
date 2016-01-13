class Draft < ActiveRecord::Base
	belongs_to :user
	belongs_to :industry
	belongs_to :position

  validates_presence_of :answer1
end
