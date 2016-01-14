class TopicsController < ApplicationController
	def index
		@industries=Industry.all

		if params[:p]
			@position=Position.find(params[:p])
			@topics=@position.topics.page( params[:page] ).per(5)
			if params[:i]
				@industry=Industry.find(params[:i])
				@topics=@topics.where(industry_id:params[:i]).page( params[:page] ).per(5)

			end
		else
			@topics=Topic.page( params[:page] ).per(5)
		end

    if params[:order]
      if params[:order] == 'comment_count'
        sort_by = 'comment_count DESC'
      elsif params[:order] == 'working_time'
        sort_by = 'working_time DESC'
      else
        sort_by = 'created_at'
      end
        
      @topics = @topics.order(sort_by)
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

  def welcome
      @positions = Position.page(params[:page]).per(4)

  end


  # def create
  # 	@topic = Topic.new(topic_params)

  # 	if @topic.save

  # 	else
  # 		flash.now[:alert] = @topic.errors.full_messages.join(',')
  # 		render :new
  # 	end
  # end

end
