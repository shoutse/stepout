class TopicsController < ApplicationController
	def index  #
		@topics=Topic.all
		@industries=Industry.all
	end
end
