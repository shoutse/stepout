class Position < ActiveRecord::Base
	has_many :topics
	has_many :drafts
end
