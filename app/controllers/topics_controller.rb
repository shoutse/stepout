class TopicsController < ApplicationController
	def index  
		@industries=Industry.all

		if params[:p]
			@position=Position.find(params[:p])
			@topics=@position.topics
			if params[:i]
				@industry=Industry.find(params[:i])
				@topics=@topics.where(industry_id:params[:i])

			end
		else
			@topics=Topic.all
		end
	end
end
