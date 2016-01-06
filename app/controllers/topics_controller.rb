class TopicsController < ApplicationController
before_action :authenticate_user!, :except => [:index]
before_action :set_topics, :except => [:index]



  def set_topics
     @topic = Topic.find(params[:id])
  end

end
