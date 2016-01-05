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

	def show
		@topic=Topic.find(params[:id])
		@comments=@topic.comments
		@comment=Comment.new
	end

  # POST /topics/:id/subscribe
  def subscribe
    @topic = Topic.find( params[:id] )
    @topic.subscriptions.create!( :user => current_user )
 
    redirect_to :back
  end
 
  def unsubscribe
    @topic = Topic.find( params[:id] )
    current_user.subscriptions.where( :topic_id => @topic.id ).destroy_all
 
    redirect_to :back
  end



end