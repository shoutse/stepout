class Admin::TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_topic, :only =>[:show, :update, :edit, :destroy]

  layout "admin"

  def show
    @comments = @topic.comments
    @comment = Comment.new
  end

  def index

    @user = User.all
    @industries = Industry.all
    @position = Position.all

    if params[:position]
      @position = Position.find(params[:position])
      @drafts = @position.drafts


    elsif params[:industry]
      @industry = Industry.find(params[:industry])
      @drafts = @industry.drafts
    else
      @drafts = Draft.all
    end

    if params[:position_topics]
      @position = Position.find(params[:position_topics])
      @topics = @position.topics
    elsif params[:industry_topics]
      @industry = Industry.find(params[:industry_topics])
      @topics = @industry.topics
    else
      @topics = Topic.all
    end

    @drafts = @drafts.page(params[:page]).per(5)
    @topics = @topics.page(params[:page]).per(5)
    # [CR] reuse the class method of Topic.search
    # @topics = Topic.search(params)
  end

     # def new
     #    @topic = Topic.new
     # end

     # def create
     #    @topic = Topic.new(topic_params)
     #    @topic=current_user.topic
     #    if @topic.save
     #      flash[:notice] = "新增成功"
     #      redirect_to admin_topics_path
     #    else
     #      render :action => :new
     #    end
     # end

     def edit

     end

     def update
        if @topic.update(topic_params)
          flash[:notice] = "編輯成功"
          redirect_to admin_topic_path
        else
          render :action => :edit
        end
     end

     def destroy
      @topic.destroy
      flash[:alert] = "刪除成功"
      redirect_to :back

     end

    protected

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:name, :content, :comment_count, :position_id, :industry_id, :user_id, :created_at, :bootsy_image_gallery_id)
    end

  # def authenticate
     # authenticate_or_request_with_http_basic do |user_name, password|
       # user_name == "username" && password == "password"
     # end
  # end
# clone into my local from Johnason

end
