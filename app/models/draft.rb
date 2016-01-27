class Draft < ActiveRecord::Base
	validates_presence_of :name,:position_id,:industry_id,:answer1,:content,:privacy,:istrue
	belongs_to :user
	belongs_to :industry
	belongs_to :position
  include Bootsy::Container

   def copy_from_draft
     @topic = Topic.new
     @topic.name = d.name
     @topic.position_id = d.position_id
     @topic.industry_id = d.industry_id
     @topic.content = d.content
     @topic.description = d.answer1
     @topic.user_id = d.user_id
     @topic.working_time = d.working_time
   end

end
