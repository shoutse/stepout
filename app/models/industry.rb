class Industry < ActiveRecord::Base
	has_many :topics
	has_many :drafts
end
