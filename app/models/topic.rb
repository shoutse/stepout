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



end
