class TopicsController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    before_action :set_topics, :except => [:index]

  def index
    # @topics = Topic.all
    # @industry = Industry.find(params[:industry_id])

  end

  def show
      if params[:pid]
       @position=@position.topics
      end
  end

  def new

  end

  def create

  end

  def set_topics
     @topic = Topic.find(params[:id])

  end


end
