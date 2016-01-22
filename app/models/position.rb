class Position < ActiveRecord::Base
	has_many :topics, :dependent => :destroy
	has_many :drafts, :dependent => :destroy


end
