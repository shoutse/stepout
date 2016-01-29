class TopicsController < ApplicationController


  before_action :load_position_and_industry
  before_action :authenticate_user!, :only => [:subscribe, :unsubscribe]

  def welcome
      @positions = Position.page(params[:page]).per(4)
  end

	def index

		if @position
			@topics = @position.topics
		else
			@topics = Topic.all
		end

    if @industry 
      @topics = @topics.where( industry_id: @industry.id )
    end

    if params[:order]
      if params[:order] == 'comment_count'
        sort_by = 'comment_count DESC'
      elsif params[:order] == 'working_time'
        sort_by = 'working_time DESC'
      else
        sort_by = 'id DESC'
      end

      @topics = @topics.order(sort_by)
    end
    # @topics = Topic.search(params)

    @topics = @topics.page( params[:page] ).per(4)
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

  private

  def load_position_and_industry
    @position = Position.find(params[:p]) if params[:p]
    @industry = Industry.find(params[:i]) if params[:i]
    @industries = Industry.all
  end
end




