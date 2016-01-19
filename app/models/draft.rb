class Draft < ActiveRecord::Base
	validates_presence_of :name,:position_id,:industry_id,:answer1,:content,:privacy,:istrue
	belongs_to :user
	belongs_to :industry
	belongs_to :position
  include Bootsy::Container

  validates_presence_of :name, :position_id, :industry_id, :content, :working_time
end
