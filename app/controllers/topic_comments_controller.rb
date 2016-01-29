class TopicCommentsController < ApplicationController
	
	before_action :authenticate_user!
	
	def create
		@topic=Topic.find(params[:topic_id])
		@comment=@topic.comments.build(comment_params)
		@comment.user=current_user
			if @comment.save
				@topic.comment_count=@topic.comment_count+1
				@topic.save
					redirect_to topic_path(@topic)
			else
				  render redirect_to topic_path(@topic)
			end
	end

	protected

	def comment_params
		params.require(:comment).permit(:content)

	end
end
