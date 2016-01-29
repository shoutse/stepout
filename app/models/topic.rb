class Topic < ActiveRecord::Base
	belongs_to :user
	belongs_to :industry
	belongs_to :position
	has_many :comments, :dependent => :destroy

  has_many :likes, :dependent => :destroy
	has_many :like_users, :through => :likes, :source => :user

  has_many :subscriptions, :dependent => :destroy
	has_many :subscription_users,:through=>:subscriptions,:source=>:user
  include Bootsy::Container


  def self.copy_from_draft(draft)
    topic = Topic.new
    topic.name = draft.name
    topic.position_id = draft.position_id
    topic.industry_id = draft.industry_id
    topic.content = draft.content
    topic.description = draft.answer1
    topic.user_id = draft.user_id
    topic.working_time = draft.working_time

    return topic
  end


  def find_my_subscription(u)
     if u
       self.subscriptions.where( :user_id => u.id ).first
     else
       nil
     end
  end

  def find_my_like(u)
     if u
       self.likes.where( :user_id => u.id ).first
     else
       nil
     end
  end

#[CR]--index
# def self.search(params)
#     topics = Topic.all
#     topics = topics.where(industry_id: params[:i]) if params[:i]
#     topics = topics.where(position_id: params[:p]) if params[:p]

#     sort_by = case params[:order]
#     when 'comment_count'
#       'comment_count DESC'
#     when 'working_time'
#       'working_time DESC'
#     else
#       'created_at'
#     end

#     topics = topics.order(sort_by)

#     topics
#   end


end
