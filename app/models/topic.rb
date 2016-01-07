class Topic < ActiveRecord::Base
	belongs_to :user
	belongs_to :industry
	belongs_to :position
	has_many :comments
	has_many :likes
	has_many :like_users,:through=>:likes,:source=>:user
	has_many :subscriptions
	has_many :subscription_users,:through=>:subscriptions,:source=>:user



end
